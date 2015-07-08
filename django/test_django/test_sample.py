from django.test import TestCase

class SampleTestCase(TestCase):

    def test_one_eq_one(self):
        self.assertEqual(1, 1)