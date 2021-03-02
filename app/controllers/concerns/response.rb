module Response
  def json_response(response)
    render json: response.parsed_response, status: response.code
  end
end
