import React, { useState } from 'react';
import axios from 'axios';
import { Container, Form, Input, Button, Preview, Image, LoadingText, Results, ResultText } from './style'; // Import các styled-components

const SearchPests = () => {
    const [file, setFile] = useState(null);
    const [preview, setPreview] = useState(null);
    const [results, setResults] = useState(null);
    const [loading, setLoading] = useState(false);

    const handleFileChange = (e) => {
        const selectedFile = e.target.files[0];
        setFile(selectedFile);

        // Tạo preview cho ảnh đã chọn
        const reader = new FileReader();
        reader.onloadend = () => {
            setPreview(reader.result);
        };
        reader.readAsDataURL(selectedFile);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!file) {
            alert('Please select an image first');
            return;
        }

        setLoading(true);
        const formData = new FormData();
        formData.append('image', file);

        try {
            // Thay thế URL này bằng API thực tế của bạn
            const response = await axios.post('http://your-api-url/analyze', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            setResults(response.data);
        } catch (error) {
            console.error('Error analyzing image:', error);
            alert('Error analyzing image. Please try again.');
        }
        setLoading(false);
    };

    return (
        <Container>
            <h1>Plant Disease Analyzer</h1>
            <Form onSubmit={handleSubmit}>
                <Input
                    type="file"
                    accept="image/*"
                    onChange={handleFileChange}
                />
                <Button type="submit">Analyze</Button>
            </Form>
            {preview && (
                <Preview>
                    <h2>Selected Image:</h2>
                    <Image src={preview} alt="Preview" />
                </Preview>
            )}
            {loading && <LoadingText>Analyzing...</LoadingText>}
            {results && (
                <Results>
                    <h2>Analysis Results:</h2>
                    <ResultText>Disease: {results.disease}</ResultText>
                    <ResultText>Confidence: {results.confidence}%</ResultText>
                </Results>
            )}
        </Container>
    );
}

export default SearchPests;
