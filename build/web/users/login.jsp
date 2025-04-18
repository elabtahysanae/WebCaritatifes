<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: -50px;
            left: -50px;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(74, 111, 220, 0.1) 0%, rgba(74, 111, 220, 0) 70%);
            border-radius: 50%;
            z-index: -1;
        }
        
        body::after {
            content: '';
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(76, 175, 80, 0.1) 0%, rgba(76, 175, 80, 0) 70%);
            border-radius: 50%;
            z-index: -1;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }
        
        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #4a6fdc, #4CAF50);
        }

        @keyframes slideUp {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 35px;
            position: relative;
        }

        .login-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 12px;
            position: relative;
            display: inline-block;
        }
        
        .login-header h1::after {
            content: '';
            display: block;
            width: 60%;
            height: 4px;
            background: linear-gradient(90deg, #4a6fdc, #4CAF50);
            border-radius: 2px;
            margin: 8px auto 0;
        }

        .login-header p {
            color: #718096;
            font-size: 16px;
            font-weight: 400;
        }
        
        .form-group {
            margin-bottom: 24px;
            position: relative;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #4a5568;
            font-size: 15px;
            transition: color 0.3s ease;
        }
        
        .form-group:focus-within label {
            color: #4a6fdc;
        }

        .input-wrapper {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            color: #a0aec0;
            transition: color 0.3s ease;
        }
        
        .form-group:focus-within .input-icon {
            color: #4a6fdc;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 14px 14px 14px 45px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            color: #2d3748;
            background-color: #f8fafc;
            margin-bottom: 0;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #4a6fdc;
            box-shadow: 0 0 0 3px rgba(74, 111, 220, 0.15);
            outline: none;
            background-color: #fff;
        }
        
        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: #a0aec0;
        }

        .login-btn {
            background: linear-gradient(90deg, #4a6fdc, #4CAF50);
            border: none;
            color: white;
            padding: 16px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 4px 10px rgba(74, 111, 220, 0.2);
            position: relative;
            overflow: hidden;
        }

        .login-btn:hover {
            box-shadow: 0 6px 15px rgba(74, 111, 220, 0.3);
            transform: translateY(-2px);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .login-btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }
        
        .login-btn:hover::before {
            left: 100%;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            font-size: 15px;
            color: #4a5568;
        }
        
        .register-link a {
            color: #4a6fdc;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
            position: relative;
        }
        
        .register-link a:hover {
            color: #3a5fc8;
        }
        
        .register-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #4a6fdc, #4CAF50);
            transition: width 0.3s ease;
        }
        
        .register-link a:hover::after {
            width: 100%;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
            color: #a0aec0;
            font-size: 14px;
        }
        
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: #e2e8f0;
        }
        
        .divider::before {
            margin-right: 15px;
        }
        
        .divider::after {
            margin-left: 15px;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            border-radius: 10px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        
        .social-icon {
            width: 24px;
            height: 24px;
            color: #4a5568;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 25px;
            font-size: 14px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #4a5568;
        }
        
        .forgot-password {
            color: #4a6fdc;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .forgot-password:hover {
            color: #3a5fc8;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .login-container {
                padding: 30px 20px;
            }
            
            .login-header h1 {
                font-size: 24px;
            }
            
            .login-header p {
                font-size: 14px;
            }
            
            .remember-forgot {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Bienvenue</h1>
           
        </div>
        
        <form method="POST" action="../LoginController">
            <div class="form-group">
                <label for="email">Adresse email</label>
                <div class="input-wrapper">
                    <svg class="input-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                    <input type="email" id="email" name="email" placeholder="votre.email@exemple.com" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="mdp">Mot de passe</label>
                <div class="input-wrapper">
                    <svg class="input-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                    <input type="password" id="mdp" name="mdp" placeholder="Votre mot de passe" required>
                </div>
            </div>
            
            <div class="remember-forgot">
               
                <a href="#" class="forgot-password">Mot de passe oublié?</a>
            </div>
            
            <button type="submit" href="user.jsp" class="login-btn">Se connecter</button>
        </form>
        
        <div class="divider">OU</div>
        
       
        
        <div class="register-link">
            Vous n'avez pas de compte ? <a href="user.jsp">Inscrivez-vous ici</a>
        </div>
    </div>
</body>
</html>