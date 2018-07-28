
#验证手机号码
window.checkPhone = ->
  phone = $('#phone').val()
  pattern = /^1[0-9]{10}$/
  window.isPhone = 1
  if !pattern.test(phone)
    alert '请输入正确的手机号码'
    window.isPhone = 0

#倒计时
window.resetCode = ->
  $('#J_getCode').hide()
  $('#J_second').html '60'
  $('#J_resetCode').show()
  second = 60
  timer = null
  timer = setInterval((->
    second -= 1
    if second > 0
      $('#J_second').html second
    else
      clearInterval timer
      $('#J_getCode').show()
      $('#J_resetCode').hide()
  ), 1000)

window.isPhone = 1
window.getCode = (e) ->
	checkPhone()
	if window.isPhone
    mobile = $('#phone').val()
    $.post '/users/get_msg_code', { mobile_phone: mobile }, (data) ->
      resetCode()
	else
		$('#phone').focus()
