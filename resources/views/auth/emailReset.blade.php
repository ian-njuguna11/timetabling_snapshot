<!DOCTYPE html>
<html>
<head>
    <title>Kabarak Timetabling</title>
    
    <style>
        /* CSS */
.button-1 {
  background-color: maroon;
  border-radius: 8px;
  border-style: none;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  font-weight: 500;
  height: 40px;
  line-height: 20px;
  list-style: none;
  margin: 0;
  outline: none;
  padding: 10px 16px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transition: color 100ms;
  vertical-align: baseline;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-1:hover,
.button-1:focus {
  background-color: rgb(248, 9, 9);
}
    </style>
    
    
</head>
<body>
    <h1>{{ $details['title'] }}</h1>
    <p>{{ $details['body'] }}</p>
    {{-- "email" => $email,
    "newpasskey --}}
    
    <h3> Use the credentials to login...  </h3>
        
        <a href="{{ $details['confirmation_url'] }}" >
            <button class="button-1" type="button">
                    Click here!
            </button>
        </a>
       
    <p>Thank you.</p>
</body>
</html>