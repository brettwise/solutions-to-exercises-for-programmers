defmodule AllTogether.PageController do
  use AllTogether.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def calc_tip(conn, _params) do
    render conn, "calc-tip.html"
  end

  def saying_hello(conn, _params) do
    render conn, "saying-hello.html"
  end

  def number_of_chars(conn, _params) do
    render conn, "number-of-chars.html"
  end

  def print_quotes(conn, _params) do
    render conn, "print-quotes.html"
  end
end
