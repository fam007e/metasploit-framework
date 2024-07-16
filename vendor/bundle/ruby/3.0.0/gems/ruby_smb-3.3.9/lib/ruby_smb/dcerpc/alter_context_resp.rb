module RubySMB
  module Dcerpc
    # The Alter context resp PDU as defined in
    # [The alter_context_resp PDU](https://pubs.opengroup.org/onlinepubs/9629399/chap12.htm#tagcjh_17_06_04_02)

    class AlterContextResp < BinData::Record
      PTYPE = PTypes::ALTER_CONTEXT_RESP

      # Presentation context negotiation results
      ACCEPTANCE         = 0
      USER_REJECTION     = 1
      PROVIDER_REJECTION = 2

      # Reasons for rejection of a context element
      REASON_NOT_SPECIFIED                     = 0
      ABSTRACT_SYNTAX_NOT_SUPPORTED            = 1
      PROPOSED_TRANSFER_SYNTAXES_NOT_SUPPORTED = 2
      LOCAL_LIMIT_EXCEEDED                     = 3

      endian :little

      # PDU Header
      pdu_header      :pdu_header, label: 'PDU header'
      ndr_uint16      :max_xmit_frag, label: 'Max transmit frag size', initial_value: RubySMB::Dcerpc::MAX_XMIT_FRAG
      ndr_uint16      :max_recv_frag, label: 'Max receive frag size', initial_value: RubySMB::Dcerpc::MAX_RECV_FRAG
      ndr_uint32      :assoc_group_id, label: 'Association group ID'
      port_any_t      :sec_addr, label: 'Secondary address'
      p_result_list_t :p_result_list, label: 'Presentation context result list'

      # Auth Verifier
      sec_trailer     :sec_trailer, onlyif: -> { pdu_header.auth_length > 0 }
      string          :auth_value,
        onlyif: -> { pdu_header.auth_length > 0 },
        read_length: -> { pdu_header.auth_length }

      def initialize_instance
        super
        pdu_header.ptype = PTYPE
      end
    end
  end
end