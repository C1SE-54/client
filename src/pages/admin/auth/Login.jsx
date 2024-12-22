import React, { Component } from "react";
import { Link, useNavigate } from "react-router-dom"; // Nhập useNavigate

const Login = () => {
    const navigate = useNavigate(); // Khai báo useNavigate

    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    const loginHandler = (event) => {
        event.preventDefault();
        // Thêm logic đăng nhập của bạn ở đây (ví dụ: gọi API)
        navigate('/dashboard'); // Sử dụng navigate để chuyển hướng
        window.location.reload();
    };

    return (
        <div className="fullsheet">
            <div className="auth-form">
                <div className="avatar"></div>
                <h4 className="modal-title">Login to Your Account</h4>
                <form onSubmit={loginHandler}>
                    <div className="form-group">
                        <input
                            type="email"
                            className="form-control"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            name="email"
                            placeholder="Enter Email"
                            required
                        />
                    </div>
                    <div className="form-group">
                        <input
                            type="password"
                            className="form-control"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            name="password"
                            placeholder="***********"
                            required
                        />
                    </div>
                    <div className="form-group small clearfix">
                        <label className="checkbox-inline">
                            <input type="checkbox" /> Remember me
                        </label>
                        <button type="button" data-toggle="modal" data-target="#model" className="forgot-link btn_modal">Forgot Password?</button>
                    </div>
                    <button type="submit" className="btn btn-primary btn-block btn-lg form-control mb-3">Login</button>
                </form>
                <div className="text-center small text-dark">Don't have an account? <Link to='/signup'>Sign up</Link></div>
            </div>
        </div>
    );
};

export default Login;