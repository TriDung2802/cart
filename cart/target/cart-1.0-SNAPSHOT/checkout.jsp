<%@ page import="java.util.List" %>
<%@ page import="controller.CartServlet.CartItem" %>

<!DOCTYPE html>
<html>

<head>

    <title>Checkout</title>

    <style>

        body {
            font-family: Arial;
            margin: 30px;
        }

        h2 {
            color: teal;
        }

        table {
            border-collapse: collapse;
            width: 700px;
        }

        th, td {
            border: 1px solid gray;
            padding: 8px;
        }

        th {
            text-align: left;
        }

        .right {
            text-align: right;
        }

    </style>

</head>

<body>

<h2>Checkout</h2>

<%
    List<CartItem> cartItems =
            (List<CartItem>) request.getAttribute("cartItems");

    Double total =
            (Double) request.getAttribute("total");
%>

<table>

    <tr>
        <th>Description</th>
        <th>Quantity</th>
        <th>Amount</th>
    </tr>

<%
    for (CartItem item : cartItems) {
%>

    <tr>

        <td>
            <%= item.product.description %>
        </td>

        <td>
            <%= item.quantity %>
        </td>

        <td>
            $<%= String.format("%.2f", item.getAmount()) %>
        </td>

    </tr>

<%
    }
%>

    <tr>

        <td colspan="2" class="right">
            <b>Total:</b>
        </td>

        <td>
            <b>
                $<%= String.format("%.2f", total) %>
            </b>
        </td>

    </tr>

</table>

<br>

<a href="index.jsp">
    <button>Continue Shopping</button>
</a>

</body>

</html>