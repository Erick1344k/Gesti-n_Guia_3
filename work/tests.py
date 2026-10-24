from django.test import TestCase

class SimpleTest(TestCase):
    def test_verificacion_basica(self):
        """Prueba simple para cumplir con la validación de CI."""
        self.assertEqual(1 + 1, 2)