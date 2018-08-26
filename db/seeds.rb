# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(mobile_phone: 17301693212, admin: true, password: '123456lc', name: 'Yihanghui')
WechatConfig.create(environment: 'development',
                    account: 'yihanghui',
                    appid: 'wxf21a7f12034721c9',
                    secret: 'ae9a22bf2a293ffece5f9346c0b2e033',
                    token: 'b333b63d985de6',
                    access_token: '/var/tmp/wechat_access_token',
                    jsapi_ticket: '/var/tmp/wechat_jsapi_ticket',
                    trusted_domain_fullname: "http://niucang.s1.natapp.cc")
