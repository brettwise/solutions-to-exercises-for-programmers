defmodule TipCalc.PageController do
  use TipCalc.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def calc_tip(conn, %{"tip_percentage" => tip_percentage, "bill_amount" => bill_amount}) do

    conn
    |> assign(:tip_percentage, tip_percentage)
    |> assign(:bill_amount, bill_amount)
    |> assign(:total, calc_total(bill_amount, tip_percentage))
    |> render("tip-calc.html")
  end

  def calc(conn, %{"tip_percentage" => tip_percentage}) do
    render conn, "tip-calc.html", tip_percentage: tip_percentage
  end

  def calc(conn, _params) do
    render conn, "tip-calc.html"
  end

  def calc_total(bill_amount, tip_percentage) do
    String.to_integer(tip_percentage) + String.to_float(bill_amount)
  end
end
