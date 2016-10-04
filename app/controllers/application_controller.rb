class ApplicationController < ActionController::API

  def accepted_view
    ct = get_content_type
    return '' if ct == ''
    ".#{ct}.json"
  end

  def accepted_method
    ct = get_content_type
    return '' if ct == ''
    ct_method = ct.sub('.','_')
    "_#{ct_method}"
  end

  def get_content_type
    ct = request.headers["Accept"]
    raise 'Invalid content type' if !ct.start_with?('application')
    return '' if ct == 'application/json'

    /(?:vnd\.myuscis\.)([a-zA-Z0-9\.]*)/.match(ct)[1]
  end
end
