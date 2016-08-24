defmodule AllTogether.PageController do
  use AllTogether.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def saying_hello(conn, _params) do
    render conn, "saying-hello.html"
  end
end
