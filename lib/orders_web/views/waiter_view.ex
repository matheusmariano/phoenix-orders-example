defmodule OrdersWeb.WaiterView do
  use OrdersWeb, :view
  alias OrdersWeb.WaiterView

  def render("index.json", %{waiters: waiters}) do
    %{data: render_many(waiters, WaiterView, "waiter.json")}
  end

  def render("show.json", %{waiter: waiter}) do
    %{data: render_one(waiter, WaiterView, "waiter.json")}
  end

  def render("waiter.json", %{waiter: waiter}) do
    %{id: waiter.id,
      name: waiter.name}
  end
end
