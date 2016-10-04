class ApplicationController < ActionController::API

  def accepted_view
    ct = get_content_type
    ".#{ct}.json"
  end

  def accepted_method
    ct = get_content_type
    ct_method = ct.sub('.','_')
    "_#{ct_method}"
  end

  def get_content_type
    ct = request.headers["Accept"]
    return default_content_type if ct == '*/*' || ct == 'application/json'
    raise 'Invalid content type' if !ct.start_with?('application')

    /(?:vnd\.myuscis\.)([a-zA-Z0-9\.]*)/.match(ct)[1]
  end

  def default_content_type
    'v2'
  end
end
