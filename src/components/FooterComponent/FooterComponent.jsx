import React from 'react';
import { FooterWrapper } from './style'; // Import styled component

const FooterComponent = () => {
    return (
        <FooterWrapper>
            <p>&copy; 2024 AgriGenius. All rights reserved.</p>
            {/* Nếu có link thêm */}
            <p>
                <a href="/privacy">Privacy Policy</a> | <a href="/terms">Terms of Service</a>
            </p>
        </FooterWrapper>
    );
}

export default FooterComponent;
