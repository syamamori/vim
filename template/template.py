#!/usr/bin/env python
# vim: set fileencoding=utf-8 :
#
# Author:   yamamori
# Created:  <+DATE+>

import unittest


class TestILQRmethod(unittest.TestCase):

    def setUp(self):
        pass

    def test_1(self):
        # <+CURSOR+>
        pass


def suite():
    suite = unittest.TestSuite()
    suite.addTest(TestILQRmethod("test_1"))


if __name__ == "__main__":
    runner = unittest.TextTestRunner()
    runner.run(suite())
