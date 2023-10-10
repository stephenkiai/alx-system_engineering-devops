#!/usr/bin/python3
"""Function to count words in all hot posts of a given Reddit subreddit
   that are found in a list
"""
import requests


def count_words(subreddit, word_list, array=None, after=""):
