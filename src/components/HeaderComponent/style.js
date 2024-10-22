import { Row } from "antd";
import styled from "styled-components";


export const WrapperHeader = styled(Row)`
  padding: 15px 80px;
  background-color: #1A94E1;
  align-items: center;
  gap: 20px;
  flex-wrap: nowrap;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  
  /* Responsive breakpoints */
  @media (max-width: 1024px) {
    padding: 12px 60px;
  }
  
  @media (max-width: 768px) {
    padding: 10px 40px;
    gap: 15px;
  }

  @media (max-width: 576px) {
    padding: 8px 20px;
    gap: 10px;
  }
`;

export const WrapperTextHeader = styled.span`
  font-size: 24px;
  color: #fff;
  font-weight: bold;
  text-align: left;
  letter-spacing: 1px;
  transition: color 0.3s ease;

  &:hover {
    color: #E8F4FB;
  }

  /* Responsive breakpoints */
  @media (max-width: 1024px) {
    font-size: 22px;
  }

  @media (max-width: 768px) {
    font-size: 20px;
  }

  @media (max-width: 576px) {
    font-size: 18px;
  }
`;

export const WrapperHeaderAccount = styled.div`
  display: flex;
  align-items: center;
  color: #fff;
  gap: 12px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    color: #E8F4FB;
  }

  /* Responsive breakpoints */
  @media (max-width: 1024px) {
    gap: 10px;
    font-size: 13px;
  }

  @media (max-width: 768px) {
    gap: 8px;
    font-size: 12px;
  }

  @media (max-width: 576px) {
    gap: 6px;
    font-size: 11px;
  }
`;

export const WrapperTextHeaderSmall = styled.span`
  font-size: 14px;
  color: #fff;
  white-space: nowrap;
  letter-spacing: 0.5px;
  transition: color 0.3s ease;

  &:hover {
    color: #E8F4FB;
  }

  /* Responsive breakpoints */
  @media (max-width: 1024px) {
    font-size: 13px;
  }

  @media (max-width: 768px) {
    font-size: 12px;
  }

  @media (max-width: 576px) {
    font-size: 11px;
  }
`;
