module RubySMB
  class Server
    class ServerClient
      # Contains the methods for handling encryption / decryption
      module Encryption
        def smb3_encrypt(data, session)
          encryption_algorithm = SMB2::EncryptionCapabilities::ENCRYPTION_ALGORITHM_MAP[@cipher_id]
          raise RubySMB::Error::EncryptionError.new('The encryption algorithm has not been set') if encryption_algorithm.nil?

          key_bit_len = OpenSSL::Cipher.new(encryption_algorithm).key_len * 8

          case @dialect
          when '0x0300', '0x0302'
            server_encryption_key = RubySMB::Crypto::KDF.counter_mode(
              session.key,
              "SMB2AESCCM\x00",
              "ServerOut\x00",
              length: key_bit_len
            )
          when '0x0311'
            server_encryption_key = RubySMB::Crypto::KDF.counter_mode(
              session.key,
              "SMBS2CCipherKey\x00",
              @preauth_integrity_hash_value,
              length: key_bit_len
            )
          else
            raise RubySMB::Error::EncryptionError.new('Dialect is incompatible with SMBv3 decryption')
          end

          th = RubySMB::SMB2::Packet::TransformHeader.new(flags: 1, session_id: session.id)
          th.encrypt(data, server_encryption_key, algorithm: encryption_algorithm)
          th
        end

        def smb3_decrypt(encrypted_request, session)
          encryption_algorithm = SMB2::EncryptionCapabilities::ENCRYPTION_ALGORITHM_MAP[@cipher_id]
          raise RubySMB::Error::EncryptionError.new('The encryption algorithm has not been set') if encryption_algorithm.nil?

          key_bit_len = OpenSSL::Cipher.new(encryption_algorithm).key_len * 8

          case @dialect
          when '0x0300', '0x0302'
            client_encryption_key = RubySMB::Crypto::KDF.counter_mode(
              session.key,
              "SMB2AESCCM\x00",
              "ServerIn \x00",
              length: key_bit_len
            )
          when '0x0311'
            client_encryption_key = RubySMB::Crypto::KDF.counter_mode(
              session.key,
              "SMBC2SCipherKey\x00",
              @preauth_integrity_hash_value,
              length: key_bit_len
            )
          else
            raise RubySMB::Error::EncryptionError.new('Dialect is incompatible with SMBv3 encryption')
          end

          encrypted_request.decrypt(client_encryption_key, algorithm: encryption_algorithm)
        end
      end
    end
  end
end
