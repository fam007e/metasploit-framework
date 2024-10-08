require 'metasploit/framework/login_scanner/base'
require 'metasploit/framework/login_scanner/rex_socket'

module Metasploit
  module Framework
    module LoginScanner
      #
      # HTTP-specific login scanner.
      #
      class HTTP
        include Metasploit::Framework::LoginScanner::Base
        include Metasploit::Framework::LoginScanner::RexSocket

        AUTHORIZATION_HEADER = 'WWW-Authenticate'.freeze
        DEFAULT_REALM = nil
        DEFAULT_PORT = 80
        DEFAULT_SSL_PORT = 443
        DEFAULT_HTTP_SUCCESS_CODES = [200, 201].append(*(300..309))
        DEFAULT_HTTP_NOT_AUTHED_CODES = [401]
        LIKELY_PORTS = [80, 443, 8000, 8080]
        LIKELY_SERVICE_NAMES = %w[http https]
        PRIVATE_TYPES = [:password]
        REALM_KEY = Metasploit::Model::Realm::Key::ACTIVE_DIRECTORY_DOMAIN

        # @!attribute uri
        #   @return [String] The path and query string on the server to
        #     authenticate to.
        attr_accessor :uri

        # @!attribute uri
        #   @return [String] HTTP method, e.g. "GET", "POST"
        attr_accessor :method

        # @!attribute user_agent
        #   @return [String] the User-Agent to use for the HTTP requests
        attr_accessor :user_agent

        # @!attribute vhost
        #   @return [String] the Virtual Host name for the target Web Server
        attr_accessor :vhost

        # @!attribute evade_uri_encode_mode
        #   @return [String] The type of URI encoding to use
        attr_accessor :evade_uri_encode_mode

        # @!attribute evade_uri_full_url
        #   @return [Boolean] Whether to use the full URL for all HTTP requests
        attr_accessor :evade_uri_full_url

        # @!attribute evade_pad_method_uri_count
        #   @return [Integer] How many whitespace characters to use between the method and uri
        attr_accessor :evade_pad_method_uri_count

        # @!attribute evade_pad_uri_version_count
        #   @return [Integer] How many whitespace characters to use between the uri and version
        attr_accessor :evade_pad_uri_version_count

        # @!attribute evade_pad_method_uri_type
        #   @return [String] What type of whitespace to use between the method and uri
        attr_accessor :evade_pad_method_uri_type

        # @!attribute evade_pad_uri_version_type
        #   @return [String] What type of whitespace to use between the uri and version
        attr_accessor :evade_pad_uri_version_type

        # @!attribute evade_method_random_valid
        #   @return [Boolean] Whether to use a random, but valid, HTTP method for request
        attr_accessor :evade_method_random_valid

        # @!attribute evade_method_random_invalid
        #   @return [Boolean] Whether to use a random invalid, HTTP method for request
        attr_accessor :evade_method_random_invalid

        # @!attribute evade_method_random_case
        #   @return [Boolean] Whether to use random casing for the HTTP method
        attr_accessor :evade_method_random_case

        # @!attribute evade_version_random_valid
        #   @return [Boolean] Whether to use a random, but valid, HTTP version for request
        attr_accessor :evade_version_random_valid

        # @!attribute evade_version_random_invalid
        #   @return [Boolean] Whether to use a random invalid, HTTP version for request
        attr_accessor :evade_version_random_invalid

        # @!attribute evade_uri_dir_self_reference
        #   @return [Boolean] Whether to insert self-referential directories into the uri
        attr_accessor :evade_uri_dir_self_reference

        # @!attribute evade_uri_dir_fake_relative
        #   @return [Boolean] Whether to insert fake relative directories into the uri
        attr_accessor :evade_uri_dir_fake_relative

        # @!attribute evade_uri_use_backslashes
        #   @return [Boolean] Whether to use back slashes instead of forward slashes in the uri
        attr_accessor :evade_uri_use_backslashes

        # @!attribute evade_pad_fake_headers
        #   @return [Boolean] Whether to insert random, fake headers into the HTTP request
        attr_accessor :evade_pad_fake_headers

        # @!attribute evade_pad_fake_headers_count
        #   @return [Integer] How many fake headers to insert into the HTTP request
        attr_accessor :evade_pad_fake_headers_count

        # @!attribute evade_pad_get_params
        #   @return [Boolean] Whether to insert random, fake query string variables into the request
        attr_accessor :evade_pad_get_params

        # @!attribute evade_pad_get_params_count
        #   @return [Integer] How many fake query string variables to insert into the request
        attr_accessor :evade_pad_get_params_count

        # @!attribute evade_pad_post_params
        #   @return [Boolean] Whether to insert random, fake post variables into the request
        attr_accessor :evade_pad_post_params

        # @!attribute evade_pad_post_params_count
        #   @return [Integer] How many fake post variables to insert into the request
        attr_accessor :evade_pad_post_params_count

        # @!attribute evade_shuffle_get_params
        #   @return [Boolean] Randomize order of GET parameters
        attr_accessor :evade_shuffle_get_params

        # @!attribute evade_shuffle_post_params
        #   @return [Boolean] Randomize order of POST parameters
        attr_accessor :evade_shuffle_post_params

        # @!attribute evade_uri_fake_end
        #   @return [Boolean] Whether to add a fake end of URI (eg: /%20HTTP/1.0/../../)
        attr_accessor :evade_uri_fake_end

        # @!attribute evade_uri_fake_params_start
        #   @return [Boolean] Whether to add a fake start of params to the URI (eg: /%3fa=b/../)
        attr_accessor :evade_uri_fake_params_start

        # @!attribute evade_header_folding
        #   @return [Boolean]  Whether to enable folding of HTTP headers
        attr_accessor :evade_header_folding

        # @!attribute ntlm_use_ntlmv2_session
        #   @return [Boolean] Whether to activate the 'Negotiate NTLM2 key' flag, forcing the use of a NTLMv2_session
        attr_accessor :ntlm_use_ntlmv2_session

        # @!attribute ntlm_use_ntlmv2
        #   @return [Boolean] Whether to use NTLMv2 instead of NTLM2_session when 'Negotiate NTLM2' is enabled
        attr_accessor :ntlm_use_ntlmv2

        # @!attribute ntlm_send_lm
        #   @return [Boolean] Whether to always send the LANMAN response (except when NTLMv2_session is specified)
        attr_accessor :ntlm_send_lm

        # @!attribute ntlm_send_ntlm
        #   @return [Boolean] Whether to activate the 'Negotiate NTLM key' flag, indicating the use of NTLM responses
        attr_accessor :ntlm_send_ntlm

        # @!attribute ntlm_send_spn
        #   @return [Boolean] Whether to send an avp of type SPN in the NTLMv2 client blob.
        attr_accessor :ntlm_send_spn

        # @!attribute ntlm_use_lm_key
        #   @return [Boolean] Activate the 'Negotiate Lan Manager Key' flag, using the LM key when the LM response is sent
        attr_accessor :ntlm_use_lm_key

        # @!attribute ntlm_domain
        #   @return [String] The NTLM domain to use during authentication
        attr_accessor :ntlm_domain

        # @!attribute digest_auth_iis
        #   @return [Boolean] Whether to conform to IIS digest authentication mode.
        attr_accessor :digest_auth_iis

        # @!attribute http_username
        # @return [String]
        attr_accessor :http_username

        # @!attribute http_password
        # @return [String]
        attr_accessor :http_password

        # @!attribute kerberos_authenticator_factory
        # @return [Func<username, password, realm> : Msf::Exploit::Remote::Kerberos::ServiceAuthenticator::HTTP] A factory method for creating a kerberos authenticator
        attr_accessor :kerberos_authenticator_factory

        # @!attribute keep_connection_alive
        # @return [Boolean] Whether to keep the connection open after a successful login
        attr_accessor :keep_connection_alive

        # @!attribute http_success_codes
        # @return [Array][Int] list of valid http response codes
        attr_accessor :http_success_codes

        validate :validate_http_codes

        validates :uri, presence: true, length: { minimum: 1 }

        validates :method,
                  presence: true,
                  length: { minimum: 1 }

        # (see Base#check_setup)
        def check_setup
          http_client = Rex::Proto::Http::Client.new(
            host, port, {'Msf' => framework, 'MsfExploit' => framework_module}, ssl, ssl_version, proxies, http_username, http_password
          )
          request = http_client.request_cgi(
            'uri' => uri,
            'method' => method
          )

          begin
            # Use _send_recv instead of send_recv to skip automatic
            # authentication
            response = http_client._send_recv(request)
          rescue ::EOFError, Errno::ETIMEDOUT, OpenSSL::SSL::SSLError, Rex::ConnectionError, ::Timeout::Error
            return 'Unable to connect to target'
          end

          if authentication_required?(response)
            return false
          end

          'No authentication required'
        end

        # Sends a HTTP request with Rex
        #
        # @param [Hash] opts native support includes the following (also see Rex::Proto::Http::Request#request_cgi)
        # @option opts [String] 'host' The remote host
        # @option opts [Integer] 'port' The remote port
        # @option opts [Boolean] 'ssl' The SSL setting, TrueClass or FalseClass
        # @option opts [String]  'proxies' The proxies setting
        # @option opts [Credential] 'credential' A credential object
        # @option opts [Rex::Proto::Http::Client] 'http_client' object that can be used by the function
        # @option opts ['Hash'] 'context' A context
        # @raise [Rex::ConnectionError] One of these errors has occurred: EOFError, Errno::ETIMEDOUT, Rex::ConnectionError, ::Timeout::Error
        # @return [Rex::Proto::Http::Response] The HTTP response
        # @return [NilClass] An error has occurred while reading the response (see #Rex::Proto::Http::Client#read_response)
        def send_request(opts)
          close_client = !opts.key?(:http_client)
          cli = opts.fetch(:http_client) { create_client(opts) }

          begin
            cli.connect
            req = cli.request_cgi(opts)

            # Authenticate by default
            res = if opts['authenticate'].nil? || opts['authenticate']
                    cli.send_recv(req)
                  else
                    cli._send_recv(req)
                  end
          rescue ::EOFError, Errno::ETIMEDOUT, Errno::ECONNRESET, Rex::ConnectionError, OpenSSL::SSL::SSLError, ::Timeout::Error => e
            raise Rex::ConnectionError, e.message
          ensure
            # If we didn't create the client, don't close it
            if close_client
              cli.close
            end
          end

          res
        end


        # Attempt a single login with a single credential against the target.
        #
        # @param credential [Credential] The credential object to attempt to
        #   login with.
        #
        # @return [Result] A Result object indicating success or failure
        def attempt_login(credential)
          result_opts = {
            credential: credential,
            status: Metasploit::Model::Login::Status::INCORRECT,
            proof: nil,
            host: host,
            port: port,
            protocol: 'tcp'
          }

          if ssl
            result_opts[:service_name] = 'https'
          else
            result_opts[:service_name] = 'http'
          end

          request_opts = {'credential'=>credential, 'uri'=>uri, 'method'=>method}
          if keep_connection_alive
            request_opts[:http_client] = create_client(request_opts)
          end

          begin
            response = send_request(request_opts)
            if response && http_success_codes.include?(response.code)
              result_opts.merge!(status: Metasploit::Model::Login::Status::SUCCESSFUL, proof: response.headers)
            end
          rescue Rex::ConnectionError => e
            result_opts.merge!(status: Metasploit::Model::Login::Status::UNABLE_TO_CONNECT, proof: e)
          rescue ::Rex::Proto::Kerberos::Model::Error::KerberosError => e
            mapped_err = Metasploit::Framework::LoginScanner::Kerberos.login_status_for_kerberos_error(e)
            result_opts.merge!(status: mapped_err, proof: e)
          ensure
            if request_opts.key?(:http_client)
              if result_opts[:status] == Metasploit::Model::Login::Status::SUCCESSFUL
                result_opts[:connection] = request_opts[:http_client]
              else
                request_opts[:http_client].close
              end
            end
          end

          Result.new(result_opts)
        end

        protected

        # Returns a boolean value indicating whether the request requires authentication or not.
        #
        # @param [Rex::Proto::Http::Response] response The response received from the HTTP endpoint
        # @return [Boolean] True if the request required authentication; otherwise false.
        def authentication_required?(response)
          return false unless response

          self.class::DEFAULT_HTTP_NOT_AUTHED_CODES.include?(response.code) &&
            response.headers[self.class::AUTHORIZATION_HEADER]
        end

        private

        def create_client(opts)
          rhost = opts['host'] || host
          rport = opts['rport'] || port
          cli_ssl = opts['ssl'] || ssl
          cli_ssl_version = opts['ssl_version'] || ssl_version
          cli_proxies = opts['proxies'] || proxies
          username = opts['credential'] ? opts['credential'].public : http_username
          password = opts['credential'] ? opts['credential'].private : http_password
          realm = opts['credential'] ? opts['credential'].realm : nil
          context = opts['context'] || { 'Msf' => framework, 'MsfExploit' => framework_module}

          kerberos_authenticator = nil
          if kerberos_authenticator_factory
            kerberos_authenticator = kerberos_authenticator_factory.call(username, password, realm)
          end

          http_logger_subscriber = framework_module.nil? ? nil : Rex::Proto::Http::HttpLoggerSubscriber.new(logger: framework_module)
          res = nil
          cli = Rex::Proto::Http::Client.new(
            rhost,
            rport,
            context,
            cli_ssl,
            cli_ssl_version,
            cli_proxies,
            username,
            password,
            kerberos_authenticator: kerberos_authenticator,
            subscriber: http_logger_subscriber
          )
          configure_http_client(cli)

          if realm
            cli.set_config('domain' => realm)
          end

          cli
        end

        # This method is responsible for mapping the caller's datastore options to the
        # Rex::Proto::Http::Client configuration parameters.
        def configure_http_client(http_client)
          http_client.set_config(
            'vhost'                  => vhost || host,
            'agent'                  => user_agent
          )

          possible_params = {
            'uri_encode_mode'        => evade_uri_encode_mode,
            'uri_full_url'           => evade_uri_full_url,
            'pad_method_uri_count'   => evade_pad_method_uri_count,
            'pad_uri_version_count'  => evade_pad_uri_version_count,
            'pad_method_uri_type'    => evade_pad_method_uri_type,
            'pad_uri_version_type'   => evade_pad_uri_version_type,
            'method_random_valid'    => evade_method_random_valid,
            'method_random_invalid'  => evade_method_random_invalid,
            'method_random_case'     => evade_method_random_case,
            'version_random_valid'   => evade_version_random_valid,
            'version_random_invalid' => evade_version_random_invalid,
            'uri_dir_self_reference' => evade_uri_dir_self_reference,
            'uri_dir_fake_relative'  => evade_uri_dir_fake_relative,
            'uri_use_backslashes'    => evade_uri_use_backslashes,
            'pad_fake_headers'       => evade_pad_fake_headers,
            'pad_fake_headers_count' => evade_pad_fake_headers_count,
            'pad_get_params'         => evade_pad_get_params,
            'pad_get_params_count'   => evade_pad_get_params_count,
            'pad_post_params'        => evade_pad_post_params,
            'pad_post_params_count'  => evade_pad_post_params_count,
            'shuffle_get_params'     => evade_shuffle_get_params,
            'shuffle_post_params'    => evade_shuffle_post_params,
            'uri_fake_end'           => evade_uri_fake_end,
            'uri_fake_params_start'  => evade_uri_fake_params_start,
            'header_folding'         => evade_header_folding,
            'usentlm2_session'       => ntlm_use_ntlmv2_session,
            'use_ntlmv2'             => ntlm_use_ntlmv2,
            'send_lm'                => ntlm_send_lm,
            'send_ntlm'              => ntlm_send_ntlm,
            'SendSPN'                => ntlm_send_spn,
            'UseLMKey'               => ntlm_use_lm_key,
            'domain'                 => ntlm_domain,
            'DigestAuthIIS'          => digest_auth_iis
          }

          # Set the parameter only if it is not nil
          possible_params.each_pair do |k,v|
            next if v.nil?
            http_client.set_config(k => v)
          end

          http_client
        end

        # This method sets the sane defaults for things
        # like timeouts and TCP evasion options
        def set_sane_defaults
          self.connection_timeout ||= 20
          self.uri = '/' if self.uri.blank?
          self.method = 'GET' if self.method.blank?
          self.http_success_codes = DEFAULT_HTTP_SUCCESS_CODES if self.http_success_codes.nil?

          # Note that this doesn't cover the case where ssl is unset and
          # port is something other than a default. In that situation,
          # we don't know what the user has in mind so we have to trust
          # that they're going to do something sane.
          if !(self.ssl) && self.port.nil?
            self.port = self.class::DEFAULT_PORT
            self.ssl = false
          elsif self.ssl && self.port.nil?
            self.port = self.class::DEFAULT_SSL_PORT
          elsif self.ssl.nil? && self.port == self.class::DEFAULT_PORT
            self.ssl = false
          elsif self.ssl.nil? && self.port == self.class::DEFAULT_SSL_PORT
            self.ssl = true
          end

          if self.ssl.nil?
            self.ssl = false
          end

          nil
        end

        # Combine the base URI with the target URI in a sane fashion
        #
        # @param [Array<String>] target_uri the target URL
        # @return [String] the final URL mapped against the base
        def normalize_uri(*target_uri)
          if target_uri.count == 1
            (uri.to_s + '/' + target_uri.first.to_s).gsub(%r{/+}, '/')
          else
            new_str = target_uri * '/'
            new_str = new_str.gsub!('//', '/') while new_str.index('//')

            # Makes sure there's a starting slash
            unless new_str[0,1] == '/'
              new_str = '/' + new_str
            end

            new_str
          end
        end

        private

        def validate_http_codes
          errors.add(:http_success_codes, "HTTP codes must be an Array") unless @http_success_codes.is_a?(Array)
          @http_success_codes.each do |code|
            next if code >= 200 && code < 400
            errors.add(:http_success_codes, "Invalid HTTP code provided #{code}")
          end
        end
      end
    end
  end
end

