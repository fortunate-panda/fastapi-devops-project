from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_read_main():
    # Tests if the home page loads successfully (Status 200)
    response = client.get("/")
    assert response.status_code == 200
    # Checks if your "DevOpsFlow" title is in the HTML
    assert "DevOps" in response.text

def test_health_check():
    # Tests the invisible health endpoint
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}