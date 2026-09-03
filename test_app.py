import importlib
import pytest

sample_app_module = importlib.import_module("sample-app")
app = sample_app_module.app


@pytest.fixture
def client():
  app.config["TESTING"] = True
  with app.test_client() as client:
    yield client


def test_home_status_code(client):
  """Prueba unitaria para verificar que la ruta principal responde 200 OK"""
  response = client.get("/")
  assert response.status_code == 200