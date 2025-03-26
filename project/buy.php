<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// Fetch products from the database
$sql = "SELECT product_id, product_name, description, available_quantity,base_fare, bidding_date, bidding_time, image_path FROM products ORDER BY bidding_date, bidding_time";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Auctions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: rgb(227, 201, 167);
            background-image: url('bidblitz.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            opacity: 0.9;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .container {
            background: linear-gradient(135deg,rgb(177, 186, 49),rgb(2, 29, 57));
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 10px;
            width: 95%;
            max-width: 1150px;
            color: white;
            text-align: center;
            overflow-y: auto;
            max-height: 90vh;
        }
        h2 {
            margin-bottom: 15px;
        }
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .product-card {
            background: white;
            color: black;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .product-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }
        .product-card h3 {
            margin: 10px 0;
        }
        .product-card p {
            font-size: 14px;
            margin-bottom: 8px;
        }
        .bid-info {
            font-weight: bold;
            color: red;
        }
        .bid-button, .back-button 
        {
        background: rgba(30, 48, 2, 0.9);
        color: white;
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        margin: 10px 5px 0 0;
        }

        .bid-button:hover 
        {
            background: rgb(0, 2, 1);
        }

        .back-button 
        {
            background: rgb(255, 69, 58);
        }

    .back-button:hover 
    {
        background: rgb(200, 50, 40);
    }

    </style>
</head>
<body>

<div class="container">
    <h2>Live Auctions</h2>
    <div class="products">
        <?php
       
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-card">';
                echo '<img src="' . htmlspecialchars($row["image_path"]) . '" alt="Product Image">';
                echo '<h3>' . htmlspecialchars($row["product_name"]) . '</h3>';
                //echo nl2br(htmlspecialchars($row['description']));

                echo '<p class="bid-info">Available Quantity: ' . htmlspecialchars($row["available_quantity"]) . ' kg/litres</p>';
                echo '<p class="bid-info">Base Fare:  ₹' . htmlspecialchars($row["base_fare"]) . ' per kg/litres</p>';
                echo '<p class="bid-info">Bidding Date: ' . htmlspecialchars($row["bidding_date"]) . '</p>';
                echo '<p class="bid-info">Bidding Time: ' . htmlspecialchars($row["bidding_time"]) . '</p>';
                echo '<a href="proje.php" class="back-button">Back</a>';
                echo '<a href="info.php?product_id=' . htmlspecialchars($row["product_id"]) . '" class="bid-button">Bid Now</a>';
                
                echo '</div>';
            }
        } 
        else 
        {
            echo "<p>No products available for auction.</p>";
        }
        $conn->close();
        ?>
    </div>
    <br>
    <a href="proje.php" class="back-button">Back</a>
</div>

</body>
</html>
