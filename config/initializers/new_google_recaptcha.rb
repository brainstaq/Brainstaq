if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = "6LdMUysaAAAAAJIpOQKrY1u7Xkn1tvu4fprHPD0U"
    config.secret_key = "6LdMUysaAAAAALrcw7Qk6p6Qs4-b_1UnQGY_PjxE"
    config.minimum_score = 0.5
  end
end
