module RubySMB
  module SMB1
    module Packet
      module Trans2
        # The Trans2 Parameter Block for this particular Subcommand
        class QueryFileInformationResponseTrans2Parameters < BinData::Record
          endian :little

          uint16 :ea_error_offset, label: 'EA Error Offset'

          # Returns the length of the Trans2Parameters struct
          # in number of bytes
          def length
            do_num_bytes
          end
        end

        # The Trans2 Data Block for this particular Subcommand
        class QueryFileInformationResponseTrans2Data < BinData::Record
          string :buffer, label: 'Results Buffer', read_length: :buffer_read_length

          # Returns the length of the Trans2Data struct
          # in number of bytes
          def length
            do_num_bytes
          end
        end

        # The {RubySMB::SMB1::DataBlock} specific to this packet type.
        class QueryFileInformationResponseDataBlock < RubySMB::SMB1::Packet::Trans2::DataBlock
          uint8                                              :name,               label: 'Name', initial_value: 0x00
          string                                             :pad1,               length: -> { pad1_length }
          query_file_information_response_trans2_parameters  :trans2_parameters,  label: 'Trans2 Parameters'
          string                                             :pad2,               length: -> { pad2_length }
          query_file_information_response_trans2_data        :trans2_data,        label: 'Trans2 Data'
        end

        # A Trans2 QUERY_FILE_INFORMATION Response Packet as defined in
        # [2.2.6.8.2](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-cifs/262fd0c3-41c4-41db-9f0c-61154f694636)
        class QueryFileInformationResponse < RubySMB::GenericPacket
          COMMAND = RubySMB::SMB1::Commands::SMB_COM_TRANSACTION2

          class ParameterBlock < RubySMB::SMB1::Packet::Trans2::Response::ParameterBlock
          end

          smb_header                                  :smb_header
          parameter_block                             :parameter_block
          query_file_information_response_data_block  :data_block

          def initialize_instance
            super
            parameter_block.setup << RubySMB::SMB1::Packet::Trans2::Subcommands::QUERY_FILE_INFORMATION
            smb_header.flags.reply = 1
          end
        end
      end
    end
  end
end
