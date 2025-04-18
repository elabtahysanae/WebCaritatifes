<%-- 
    Document   : users
    Created on : 18 avr. 2025, 13:11:06
    Author     : elabtahysanae
--%>
<%@page import="entities.User"%>
<%@page import="services.UserService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Répertoire des Donneurs</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', 'Segoe UI', sans-serif;
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

            .container {
                background-color: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                padding: 40px;
                width: 100%;
                max-width: 1100px;
                position: relative;
                overflow: hidden;
            }
            
            .container::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 5px;
                background: linear-gradient(90deg, #4a6fdc, #4CAF50);
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                position: relative;
            }

            .title {
                font-size: 28px;
                font-weight: 700;
                color: #2d3748;
                position: relative;
                padding-bottom: 10px;
            }

            .title::after {
                content: '';
                display: block;
                width: 60px;
                height: 4px;
                background: linear-gradient(90deg, #4a6fdc, #4CAF50);
                border-radius: 2px;
                margin-top: 10px;
            }
            
            .title-badge {
                display: inline-block;
                background-color: rgba(74, 111, 220, 0.1);
                color: #4a6fdc;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 14px;
                font-weight: 500;
                margin-left: 15px;
                vertical-align: middle;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            }

            thead {
                background: linear-gradient(90deg, #f3f4f8, #e6e9f0);
            }

            th {
                padding: 18px 24px;
                text-align: left;
                color: #4a5568;
                font-weight: 600;
                font-size: 15px;
                letter-spacing: 0.5px;
                text-transform: uppercase;
                border-bottom: 1px solid #edf2f7;
            }

            td {
                padding: 18px 24px;
                text-align: left;
                color: #2d3748;
                border-bottom: 1px solid #edf2f7;
                font-size: 15px;
            }

            tbody tr {
                transition: all 0.3s ease;
            }

            tbody tr:hover {
                background-color: #f9fafb;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            }

            .actions-container {
                display: flex;
                gap: 12px;
            }

            .action-btn {
                text-decoration: none;
                padding: 10px 16px;
                border-radius: 8px;
                font-weight: 500;
                font-size: 14px;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                gap: 6px;
            }

            .delete-btn {
                background-color: rgba(239, 68, 68, 0.1);
                color: #ef4444;
            }

            .delete-btn:hover {
                background-color: #ef4444;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(239, 68, 68, 0.2);
            }

            .update-btn {
                background-color: rgba(74, 111, 220, 0.1);
                color: #4a6fdc;
            }

            .update-btn:hover {
                background-color: #4a6fdc;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(74, 111, 220, 0.2);
            }

            .add-button {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                margin-top: 30px;
                background: linear-gradient(90deg, #4CAF50, #45a049);
                color: white;
                padding: 14px 24px;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                transition: all 0.3s ease;
                cursor: pointer;
                box-shadow: 0 4px 10px rgba(76, 175, 80, 0.2);
                border: none;
                text-decoration: none;
            }

            .add-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(76, 175, 80, 0.3);
            }
            
            .add-button:active {
                transform: translateY(0);
            }

            .empty-message {
                text-align: center;
                padding: 40px 0;
                color: #718096;
                font-size: 16px;
                font-style: italic;
                background-color: rgba(237, 242, 247, 0.7);
                border-radius: 10px;
                border: 1px dashed #cbd5e0;
            }
            
            .icon {
                display: inline-block;
                width: 20px;
                height: 20px;
                vertical-align: middle;
                fill: currentColor;
            }
            
            .status-badge {
                display: inline-block;
                width: 8px;
                height: 8px;
                border-radius: 50%;
                margin-right: 8px;
                background-color: #4CAF50;
            }
            
            .email-cell {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            @media (max-width: 768px) {
                .container {
                    padding: 25px;
                }
                
                .header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 15px;
                }

                table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                th, td {
                    padding: 15px;
                }

                .add-button {
                    width: 100%;
                    justify-content: center;
                }
                
                .title-badge {
                    display: block;
                    margin-left: 0;
                    margin-top: 8px;
                    width: fit-content;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1 class="title">
                    Répertoire des Donneurs
                   
                </h1>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom Complet</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserService us = new UserService();
                        java.util.List<User> users = us.findAll();
                        if (users != null && !users.isEmpty()) {
                            for (User u : users) {
                    %>
                    <tr>
                        <td><strong>#<%= u.getId() %></strong></td>
                        <td>
                            <div style="display: flex; align-items: center;">
                                <span class="status-badge"></span>
                                <%= u.getNom() %>
                            </div>
                        </td>
                        <td>
                            <svg class="icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2.5 3.75a1.25 1.25 0 0 1 1.25-1.25h12.5a1.25 1.25 0 0 1 1.25 1.25v12.5a1.25 1.25 0 0 1-1.25 1.25H3.75a1.25 1.25 0 0 1-1.25-1.25V3.75zm1.25-.25a.25.25 0 0 0-.25.25v.825l7.5 5.625 7.5-5.625V3.75a.25.25 0 0 0-.25-.25H3.75zm-.25 2.178V16.25c0 .138.112.25.25.25h12.5a.25.25 0 0 0 .25-.25V5.678l-6.5 4.875a1.25 1.25 0 0 1-1.5 0l-5-3.75-1.5-1.125z"/>
                            </svg>
                            <%= u.getEmail() %>
                        </td>
                        <td class="actions-cell">
                            <a href="../UserController?id=<%= u.getId() %>&op=update" class="action-btn update-btn">
                                <svg class="icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
                                </svg>
                                Modifier
                            </a>
                            <a href="../UserController?id=<%= u.getId() %>&op=delete" class="action-btn delete-btn">
                                <svg class="icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                </svg>
                                Supprimer
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="empty-message">
                            <svg style="width: 40px; height: 40px; margin-bottom: 10px; color: #718096;" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            <p>Aucun étudiant n'est actuellement enregistré</p>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <a href="user.jsp" class="add-button">
                <svg class="icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"/>
                </svg>
                Ajouter un donneur
            </a>
        </div>
    </body>
</html>
