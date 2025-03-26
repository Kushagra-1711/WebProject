<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// Fetch products whose bidding period is over
$my_username = $_SESSION['username'];
$expired_products = [];

$sql = "SELECT product_id, product_name, image_path, bidding_date, bidding_time 
        FROM products 
        WHERE username = ? AND CONCAT(bidding_date, ' ', bidding_time) < NOW()";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $my_username);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $expired_products[] = $row;
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell Your Product</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .main-container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            gap: 20px;
        }
        .container, .my-products {
            flex: 1;
            padding: 20px;
            background: linear-gradient(135deg, rgb(177, 186, 49), rgb(1, 23, 47));
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            color: white;
            text-align: center;
        }
        .container {
            max-width: 50%;
        }
        .my-products {
            max-width: 50%;
            overflow-y: auto;
            max-height: 80vh;
        }
        h2 {
            margin-bottom: 15px;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
            outline: none;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        button {
            background: rgb(1, 19, 38);
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
        }
        button:hover {
            background: rgb(0, 2, 1);
        }
        .back-btn {
            background: rgb(255, 69, 58);
        }
        .back-btn:hover {
            background: rgb(200, 50, 40);
        }
        .product-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .product-item img {
            width: 50px;
            height: 50px;
            border-radius: 5px;
            margin-right: 10px;
        }
        .product-info {
            flex-grow: 1;
            text-align: left;
        }
    </style>
    <script>
    function goBack() {
        if (document.referrer) {
            window.history.back();
        } else {
            window.location.href = 'proje.php'; // Fallback if no history available
        }
    }
</script>

</head>
<body>

<div class="main-container">
    <!-- Sell Product Form (Left Side) -->
    <div class="container">
        <h2>Sell Your Product</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <label>Product ID:</label>
            <input type="text" name="product_id" required>

            <label>Product Name:</label>
            <input type="text" name="product_name" required>

            <label>Description:</label>
            <textarea name="description" rows="4" required></textarea>

            <label>Available Quantity:</label>
            <input type="number" name="available_quantity" min="1" required>

            <label>Base Fare:</label>
            <input type="number" name="base_fare" min="1" required>

            <label>Bidding Date:</label>
            <input type="date" name="bidding_date" required>

            <label>Bidding Time:</label>
            <input type="time" name="bidding_time" required>

            <label>Upload Product Image:</label>
            <input type="file" name="product_image" accept="image/*" required>

            <div class="btn-container">
                <button type="button" class="back-btn" onclick="window.location.href='proje.php';">Back</button>
                <button type="submit">Submit Product</button>
            </div>
        </form>
    </div>

    <!-- My Products Section (Right Side) -->
    <div class="my-products">
        <h2>My Products (Bidding Ended)</h2>
        <?php if (!empty($expired_products)) : ?>
            <?php foreach ($expired_products as $product) : ?>
                <div class="product-item">
                    <img src="<?php echo htmlspecialchars($product['image_path']); ?>" alt="Product Image">
                    <div class="product-info">
                        <strong>ID:</strong> <?php echo htmlspecialchars($product['product_id']); ?><br>
                        <strong>Name:</strong> <?php echo htmlspecialchars($product['product_name']); ?><br>
                        <strong>Bidding Date & Time:</strong> <?php echo htmlspecialchars($product['bidding_date']) . ' ' . htmlspecialchars($product['bidding_time']); ?>
                    </div>
                    <button onclick="window.location.href='participants.php?product_id=<?php echo htmlspecialchars($product['product_id']); ?>'">See Participants</button>
                </div>
            <?php endforeach; ?>
        <?php else : ?>
            <p>No expired products yet.</p>
        <?php endif; ?>
    </div>
</div>

</body>
</html>
