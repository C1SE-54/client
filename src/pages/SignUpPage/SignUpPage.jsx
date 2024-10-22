import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { WrapperContainer, WrapperForm, WrapperTitle, WrapperInput, WrapperButton, WrapperTextLight } from './style';

const SignUpPage = () => {
  const navigate = useNavigate();
  const handleNavigateLogin = () => {
    navigate('/sign-in');
  };

  const [fullname, setFullname] = useState('');
  const [firstname, setFirstname] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleSignUp = () => {
    console.log('fullname, firstname, email, password, confirmPassword: ', fullname, firstname, email, password, confirmPassword);
  };

  return (
    <WrapperContainer>
      <WrapperForm>
        <WrapperTitle>
          <h1>Đăng ký tài khoản</h1>
        </WrapperTitle>

        <WrapperInput>
          <label htmlFor="fullname">Họ và tên đệm:</label>
          <input
            type="text"
            id="fullname"
            placeholder="Nguyễn Văn"
            value={fullname}
            onChange={(e) => setFullname(e.target.value)}
          />
        </WrapperInput>

        <WrapperInput>
          <label htmlFor="firstname">Tên:</label>
          <input
            type="text"
            id="firstname"
            placeholder="Hiếu"
            value={firstname}
            onChange={(e) => setFirstname(e.target.value)}
          />
        </WrapperInput>

        <WrapperInput>
          <label htmlFor="email">Địa chỉ email:</label>
          <input
            type="email"
            id="email"
            placeholder="nva@gmail.com"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </WrapperInput>

        <WrapperInput>
          <label htmlFor="password">Mật khẩu:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </WrapperInput>

        <WrapperInput>
          <label htmlFor="confirm-password">Nhập lại mật khẩu:</label>
          <input
            type="password"
            id="confirm-password"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
          />
        </WrapperInput>

        <WrapperButton onClick={handleSignUp}>
          ĐĂNG KÍ
        </WrapperButton>

        <WrapperTextLight>
          <p>
            Quay lại trang đăng nhập?{' '}
            <a onClick={handleNavigateLogin} href="#">
              Đăng nhập
            </a>
          </p>
        </WrapperTextLight>
      </WrapperForm>
    </WrapperContainer>
  );
};

export default SignUpPage;