class MsgCodeService
  class << self
    def send_code_and_cache_sms(mobile_phone)
      cache_key = mobile_phone_cache_key(mobile_phone)
      sms_code = $redis.get(cache_key).presence || get_code
      $redis.set(cache_key, sms_code, ex: 5 * 60)
      Rails.logger.info("SEND_SMS_139971832: code#{sms_code}")
      Aliyun::Sms.send(mobile_phone, 'SMS_139971832', {code: sms_code}.to_json)
    end

    def verify_message_code(mobile_phone, sms_code)
      return true if Rails.env.development? && sms_code == '8888'
      $redis.get(mobile_phone_cache_key(mobile_phone)).to_s == sms_code.to_s
    end

    private
      def mobile_phone_cache_key(mobile_phone)
        "sms_code_for_mobile_phone:#{mobile_phone}"
      end

      def get_code
        rand(0000...9999)
      end
  end
end
