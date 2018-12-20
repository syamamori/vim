#!/usr/bin/env python
# vim: set fileencoding=utf-8 :
#
# Author:   yamamori
# Created:  <+DATE+>
# <+CURSOR+>

import unittest


class TestCase(unittest.TestCase):

    def setUp(self):
        pass

    def test_default(self):
        pass


def suite():
    suite = unittest.TestSuite()
    suite.addTest(TestCase('test_default'))
    return suite


if __name__ == "__main__":
    runner = unittest.TextTestRunner()
    runner.run(suite())
