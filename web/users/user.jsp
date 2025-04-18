<%@page import="entities.User"%>
<%@page import="services.UserService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription des Donneurs</title>
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

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 550px;
            position: relative;
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }
        
        .form-container::before {
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

        .header {
            text-align: center;
            margin-bottom: 35px;
            position: relative;
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 12px;
            position: relative;
            display: inline-block;
        }
        
        h2::after {
            content: '';
            display: block;
            width: 60%;
            height: 4px;
            background: linear-gradient(90deg, #4a6fdc, #4CAF50);
            border-radius: 2px;
            margin: 8px auto 0;
        }

        .subtitle {
            color: #718096;
            font-size: 16px;
            font-weight: 400;
        }
        
        .icon-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 24px;
            height: 24px;
            background-color: rgba(74, 111, 220, 0.1);
            color: #4a6fdc;
            border-radius: 50%;
            margin-left: 8px;
            font-size: 14px;
        }

        form {
            width: 100%;
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

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 14px 14px 45px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            color: #2d3748;
            background-color: #f8fafc;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #4a6fdc;
            box-shadow: 0 0 0 3px rgba(74, 111, 220, 0.15);
            outline: none;
            background-color: #fff;
        }
        
        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #a0aec0;
        }

        .submit-btn {
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

        .submit-btn:hover {
            box-shadow: 0 6px 15px rgba(74, 111, 220, 0.3);
            transform: translateY(-2px);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .submit-btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }
        
        .submit-btn:hover::before {
            left: 100%;
        }
        
        .form-footer {
            display: flex;
            justify-content: center;
            margin-top: 25px;
        }
        
        .back-link {
            display: inline-flex;
            align-items: center;
            color: #4a6fdc;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .back-link:hover {
            color: #3a5fc8;
        }
        
        .back-icon {
            margin-right: 6px;
            width: 16px;
            height: 16px;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 24px;
            }
            
            .subtitle {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="header">
            <h2>
                Inscription Donneur
                <span class="icon-badge">+</span>
            </h2>
           
        </div>

        <form method="POST" action="../UserController">
            <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" />

            <div class="form-group">
                <label for="nom">Nom complet</label>
                <div class="input-wrapper">
                    <svg class="input-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                    </svg>
                    <input type="text" id="nom" name="nom" value="<%= request.getParameter("nom") != null ? request.getParameter("nom") : "" %>" placeholder="Votre nom complet" required />
                </div>
            </div>

            <div class="form-group">
                <label for="email">Adresse email</label>
                <div class="input-wrapper">
                    <svg class="input-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                    <input type="text" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" placeholder="votre.email@exemple.com" required />
                </div>
            </div>

            <div class="form-group">
                <label for="mdp">Mot de passe</label>
                <div class="input-wrapper">
                    <svg class="input-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                    <input type="password" id="mdp" name="mdp" value="<%= request.getParameter("mdp") != null ? request.getParameter("mdp") : "" %>" placeholder="Créez un mot de passe sécurisé" required />
                </div>
            </div>

            <button type="submit" class="submit-btn">Créer mon compte</button>
            
            <div class="form-footer">
                <a href="users.jsp" class="back-link">
                    <svg class="back-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path fill-rule="evenodd" d="M9.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L7.414 9H15a1 1 0 110 2H7.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                    Retour à la liste des donneurs
                </a>
            </div>
        </form>
    </div>
</body>
</html>