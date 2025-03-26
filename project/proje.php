<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Auction</title>
    <script>
        window.history.forward();
        function disableBack() { window.history.forward(); }
        setTimeout("disableBack()", 0);
        window.onunload = function () { null };
    </script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            background-image: url('bidblitz.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            opacity: 0.9;
            color: #333;
        }
        header {
            background: linear-gradient(135deg,rgb(77, 56, 4), #001a33); /* Darker goldenrod to deep navy */
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: rgb(227, 201, 167);
        }

        .nav-bar {
            /* position: absolute; */
            top: 100%;
            left: 0;
            width: 100%;
            background: linear-gradient(135deg, #001a33, #02150d);
            padding: 10px 0;
            text-align: center;
            z-index: 100;
        }

        .nav-bar a {
            color: #F5E1A4;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .nav-bar a:hover {
            background-color: rgba(139, 101, 8, 0.8);
            color: #001a33;
            transform: scale(1.2);
        }
        .header-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header-left img {
            height: 150px;
            width: 350px;
            opacity: 0.7;
        }
        

        .header-middle {
            color: rgb(227, 201, 167);
            font-size: 30px;
            font-weight: bold;
            align-items: center;
            font-family: 'Dancing Script', cursive;
            display: flex;
            flex-direction: column;
            align-items: center;
            opacity: 0.7;
        }

        .header-middle img {
            height: 80px;
            width: 750px;
            margin-top: 10px;
        }

        .user-info {
            font-size: 18px;
            font-weight: bold;
            align-items: center;
        }

        .header-right {
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: flex-end;
        }

        .header-right a {
            text-decoration: none;
            color: rgb(227, 201, 167);
            background-color: rgb(1, 4, 15);
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: bold;
        }

        .header-right a:hover {
            background-color: rgba(216, 176, 75, 0.8);
        }
        .marquee-container {
            background: linear-gradient(135deg, #001a33, #02150d);
            color: rgb(227, 201, 167);
            padding: 10px 0;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            overflow: hidden;
            white-space: nowrap;
        }

        .marquee {
            display: inline-block;
            animation: marquee 25s linear infinite;
        }


        @keyframes marquee {
            from { transform: translateX(100%); }
            to { transform: translateX(-100%); }
        }
        .carousel {
            width: 100%;
            overflow: hidden;
            position: relative;
        }

        .carousel-container {
            display: flex;
            width: 500%;
            animation: slide 23s infinite linear;
        }

        .carousel img {
            width: 20%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .carousel img:hover {
            transform: scale(1.2);
        }

        @keyframes slide {
            0% { transform: translateX(0); }
            25% { transform: translateX(-20%); }
            50% { transform: translateX(-40%); }
            75% { transform: translateX(-60%); }
            100% { transform: translateX(-80%); }
        }
        .container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 40px 20px;
            flex-wrap: wrap;
        }

        .card {
            width: 300px;
            background: linear-gradient(135deg, #D4AF37, #001a33);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.1);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }

        .card img {
            width: 100%;
            height: 120px;
            object-fit: contain;
            border-bottom: solid 2px #D4AF37;
        }

        .card-content {
            padding: 20px;
            text-align: center;
        }

        .card-content h3 {
            margin: 10px;
            color: #F5E1A4;
        }

        .card-content p {
            color:rgb(2, 19, 37);
        }
        footer {
            text-align: center;
            padding: 20px;
            background-color: #021b0d;
            color: rgb(227, 201, 167);
        }
        .home-section {
            text-align: center;
            padding: 20px 5px;
            background: linear-gradient(135deg, #E6C55F, #002244); /* Softer gold to deep navy */
            margin: 10px;
            height: 80px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            color: rgb(2, 19, 37);
        }
        .rules-section {
            text-align: left;
            padding: 20px 5px;
            background: linear-gradient(135deg, #E6C55F, #002244); /* Softer gold to deep navy */
            margin: 10px;
            height: auto;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            font-size: 15px;
            color: rgb(1, 13, 27);
        }

        .home-section:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .rules-section:hover {
            transform: scale(1.01);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .home-section h2 {
            color: #F5E1A4; 
            margin: 0;
        }
        .rules-section h2 {
            color: #F5E1A4; 
            text-align: center;
            margin: 0;
        }
        .search-box {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            color: rgb(227, 201, 167) ;
        }
        .search-box input {
            width: 300px;
            padding: 8px;
            border: none;
            border-radius: 5px;
            color: rgb(1, 6, 23) ;
            background-color:  rgb(255, 255, 255) ;
            margin: 10px 5px 0 0;
        }
        .search-box button {
            background-color:rgb(1, 4, 15);
            color: rgb(232, 222, 208);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px 5px 0 0;
        }
        .search-box button:hover {
            background-color: rgba(216, 176, 75, 0.8);
        }
        .notification {
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    background: #fff3cd;
    border: 1px solid #ffeeba;
}

    </style>
</head>
<body>
    <header>
        <div class="header-left">
            <img src="bidblitzb.png" alt="Online Auction Logo"><br>
        </div>
        <div class="header-middle">
            <img src="lnm.png" alt="Auction Logo Name">
            <div class="search-box">
                <input type="text" placeholder="Search for a product...">
                <button>Search</button>
            </div>
        </div>

    </div>
        <div class="header-right">
            <span class="user-info">Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?></span>
            <a href="logout.php">LogOut</a>
        </div>
    </header>
    <div class="nav-bar">
            <a href="proje.php">Home</a>
            <a href="sell.php">Sell</a>
            <a href="buy.php">Buy</a>
            <a href="accountdet.php">Manage Account</a>
        </div>
        
        <br>
    <div class="marquee-container">
        <div class="marquee">🌟 Welcome to BidBlitz! Get the best deals on auctions. 🛒 Happy Bidding! 🎉 Limited-time offers available now ! &star;Bid with confidence, win with pride! &star; The highest bid wins, but the smartest bid conquers! &star; Turn your treasures into profit!💥</div>
    </div>
    <div class="home-section">
        <h2>Welcome to Online Auction</h2>
        <p>Discover a world of exclusive auctions where you can buy and sell rare finds, collectibles, and unique treasures.</p>
    </div>

    <div class="carousel">
        <div class="carousel-container">
            <img src="bid1.jpg" alt="Auction Item 1">
            <img src="bid22.jpg" alt="Auction Item 2">
            <img src="bid33.jpg" alt="Auction Item 3">
            <img src="bid44.jpg" alt="Auction Item 4">
            <img src="bid55.jpg" alt="Auction Item 5">
            <img src="biid6.jpg" alt="Auction Item 6">
            <img src="bid7.jpg" alt="Auction Item 7">
            <img src="bid8.jpg" alt="Auction Item 8">
            <img src="bid9.jpg" alt="Auction Item 9">
            <img src="bid10.jpg" alt="Auction Item 10">
            <img src="bid11.jpg" alt="Auction Item 11">
            <img src="almonds.jpg" alt="Auction Item 12">
            <img src="02r.png" alt="Auction Item 13">
            <img src="cashewnuts.jpg" alt="Auction Item 14">
            <img src="bananas.jpg" alt="Auction Item 15">
            <img src="apples.jpg" alt="Auction Item 16">
            <img src="pineapples.jpg" alt="Auction Item 17">
        </div>
    </div>

    <div class="container">
        <div class="card">
            <img src="home.png" alt="Home">
            <div class="card-content">
                <h3><a href="proje.php" style="text-decoration: none; color: inherit;">Home</a></h3>
                <p>Here is the overview of our website displaying rules for the Auction.</p>
            </div>
        </div>
        <div class="card">
            <img src="sellimge.png" alt="Sell">
            <div class="card-content">
                <h3><a href="sell.php" style="text-decoration: none; color: inherit;">Sell Your Product</a></h3>
                <p>List your item and get the best price.</p>
            </div>
        </div>
        <div class="card">
            <img src="buyimge.png" alt="Bid">
            <div class="card-content">
                <h3><a href="buy.php" style="text-decoration: none; color: inherit;">Bid & Win</a></h3>
                <p>Find exclusive deals and win your favorite items.</p>
            </div>
        </div>
        <div class="card">
            <img src="myac.png" alt="Account">
            <div class="card-content">
                <h3><a href="accountdet.php" style="text-decoration: none; color: inherit;">Manage Account</a></h3>
                <p>Keep track of your auctions and purchases.</p>
            </div>
        </div>
    </div>
    <div class="rules-section">
        <h2>Rules and Requirements for the Online Auction</h2>
        <p><strong>1. Product Description:</strong> Every auctioned product will include a detailed description, including specifications, condition, and images.<br><br>
    
    <strong>2. Auction Date and Time:</strong> The start and end date and time of the auction will be clearly mentioned. Bids placed after the deadline will not be accepted.<br><br>
    
    <strong>3. No Bid Cancellation:</strong> Once a bid is placed, it cannot be canceled or withdrawn under any circumstances.<br><br>
    
    <strong>4. Bidding Process:</strong> Interested participants must enter the quantity they wish to purchase and their bidding amount before submitting their bid.<br><br>
    
    <strong>5. Minimum Bid Increment:</strong> Each bid must be higher than the previous highest bid by a minimum increment as specified in the auction details.<br><br>
    
    <strong>6. Winning Bidder:</strong> The highest valid bid at the auction closing time will be declared the winner.<br><br>
    
    <strong>7. Payment Terms:</strong> The winning bidder must complete the payment within the specified time frame; failure to do so may result in disqualification.<br><br>
    
    <strong>8. Seller’s Rights:</strong> The seller reserves the right to reject any bid, extend or terminate the auction, or withdraw the product without prior notice.<br><br>
    
    <strong>9. No Warranty or Return:</strong> Unless stated otherwise, auctioned products are sold "as is," and no returns, refunds, or exchanges will be entertained.<br><br>
    
    <strong>10. Compliance with Rules:</strong> By participating in the auction, bidders agree to comply with all the terms and conditions set forth.</p>

    </div>
    <footer>
        <p>&copy; 2025 Online Auction. All rights reserved.</p>
    </footer>
</body>
</html>
