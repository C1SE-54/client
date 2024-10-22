import React from 'react';
import { Input } from 'antd';

const InputForm = (props) => {
  const { placeholder = 'Nhập text', onChange, value, ...rest } = props;

  // Sử dụng onChange trực tiếp từ props
  const handleOnChangeInput = (e) => {
    if (onChange) {
      onChange(e); // Truyền toàn bộ sự kiện thay vì chỉ giá trị
    }
  };

  return (
    <Input
      placeholder={placeholder}
      value={value}
      onChange={handleOnChangeInput}
      style={{ width: '300px', marginBottom: '10px' }}
      {...rest}
    />
  );
};

export default InputForm;