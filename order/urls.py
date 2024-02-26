from django.urls import path

from order.views import OrderCreateView, OrderListView

urlpatterns = [
    path("create/", OrderCreateView.as_view(), name="create-order"),
    path("orders/", OrderListView.as_view(), name="orders")

]


app_name = "order"
