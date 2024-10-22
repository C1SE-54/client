import React from 'react';
import { Button } from 'antd';

const ButtonComponent = ({ size, styleButton, styleTextButton, textButton, disabled, ...rests }) => {
  return (
    <Button
      style={{
        ...styleButton,
        background: disabled ? '#ccc' : styleButton?.background // Sử dụng optional chaining
      }}
      size={size}
      disabled={disabled} // Truyền thuộc tính disabled cho Button
      {...rests}
    >
      <span style={styleTextButton}>{textButton}</span>
    </Button>
  );
};

export default ButtonComponent;