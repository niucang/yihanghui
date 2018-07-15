class UsersController < ApplicationController
  skip_before_action :authentication, only: [:auth_user]
  def auth_user
    wechat_oauth2('snsapi_userinfo') do |openid, other_params|
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
                          headimgurl: web_userinfo['headimgurl'])
        login_user user
        redirect_to params[:callback_url]
      end
    end
  end

  def gift
    @advertisings = Advertising.all
    @coupons = current_user.gift.coupons
  end
end
