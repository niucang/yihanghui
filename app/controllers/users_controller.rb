class UsersController < ApplicationController
  skip_before_action :authentication, only: [:auth_user]
  layout false, only: [:gift]
  def auth_user
    wechat_oauth2('snsapi_userinfo', nil, :yihanghui) do |openid, other_params|
      user = User.find_by_openid(openid)
      if user
        login_user user
      else
        web_userinfo = Wechat.api.web_userinfo(other_params['access_token'], openid)
        user = User.create(openid: web_userinfo['openid'],
                          name: web_userinfo['nickname'],
                          #TODO 将头像存储到服务器
                          favicon: web_userinfo['headimgurl'],
                          sex: web_userinfo['sex'],
                          language: web_userinfo['language'],
                          city: web_userinfo['city'],
                          province: web_userinfo['province'],
                          country: web_userinfo['country'],
                          headimgurl: web_userinfo['headimgurl'],
                          password: web_userinfo['openid'])
        login_user user
      end
      redirect_to params[:callback_url]
    end
  end

  def gift
    @advertisings = Advertising.all.where(is_active: true)
    @gift = current_user.gift
    @coupons = @gift.coupons.includes(:coupon_type)
  end

  def register
  end

  def update
    if MsgCodeService.verify_message_code(params[:user][:mobile_phone], params[:code]) && @current_user.update!(params.require(:user).permit!)
      redirect_to get_coupons_gift_share_path(params[:gift])
    else
      render json: {ok: false}
    end
  end

  def get_msg_code
    result = MsgCodeService.send_code_and_cache_sms(params[:mobile_phone]) rescue false
    render json: {success: result}
  end

  def subscribe_info
    userinfo = Wechat.api.user(@current_user.openid)
    is_subscribe = userinfo['subscribe'] == 1
    render json: {is_subscribe: is_subscribe, }
  end

  def share_info
    gift = current_user.gift
    render json: {is_share: gift.shared_at.present? }
  end

  def subscribe_image
    qrcode_image = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=#{Wechat.api.qrcode_create_scene(params[:id], 2592000)['ticket']}"
    render json: {image: qrcode_image}
  end
end
