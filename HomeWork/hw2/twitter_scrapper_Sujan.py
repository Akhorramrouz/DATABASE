import tweepy
import time
import json

api_token = 'HJrcU46QYqoQKR1VBLwdrdY2TFIfDWQr5dsStpEl9vpqrQqU2G'
bearer_token = "AAAAAAAAAAAAAAAAAAAAAE9sjwEAAAAA9H2pN5RZEC0Q9jC5CFLo9xXEMzY%3DjOj2DTr02v45AXX1OeL4eZze9NItPvhXCjRWNL8TAOf1Ivo8KP"


api_key = 'kLXZGHXLhOGJvSUGgwBzFP8De'
api_secret = 'ruoa232ZlpEftAf3tUcsVQhBtlcEMSBMRCNjVU78xJPCoD4VRM'
# ###########
# api_secret = "UqHokxJGEpqg5e1mt7Bhst4U8o2Eb65Uz6jeii3JWmnqdxzIrO"
access_token = "4835110865-PYpkXOGxOifwjRB7CpD8PWELGeJdRYYNiuYqHNB"
access_token_secret = "yfqVP1mwKEbRXyk3fZMfgNok9s1T4nUk3ZqQr6ShP81vq"

auth = tweepy.OAuthHandler(api_key, api_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.Client(bearer_token=bearer_token,
                        wait_on_rate_limit=True)

with open("Girl_tweet.jsonl", "a") as w_obj:
    for response in tweepy.Paginator(api.search_all_tweets, 
                                        query="((زن OR خواهر) AND (انقلاب OR حقوق OR آزادی OR زندگی)) -is:retweet lang:fa", 
                                        # query=f"conversation_id:{c_id} -is:retweet",
                                        user_fields = ['username', 'public_metrics', 'description', 'location'],
                                        tweet_fields = ['created_at', 'geo', 'public_metrics', 'text', 'conversation_id'],
                                        expansions = ['author_id'],
                                        start_time = '2022-01-31T00:00:00Z',
#                                         end_time = '2020-08-01T00:00:00Z',
                                        # since_id = '1491562540475699205',
                                        # until_id = '1495909503241445380',
                                        max_results=50):

            
            # tweets.append(response)
#             print(response.data)
            time.sleep(2)
            user_dict = dict()
            if response.data:
                for user in response.includes['users']:
                    user_dict[user.id] = {'username': user.username, 
                                        'followers': user.public_metrics['followers_count'],
                                        'tweets': user.public_metrics['tweet_count'],
                                        'description': user.description,
                                        'location': user.location,
                                        'verified' : user.verified,
#                                         'following': user.friends_count,
                                        'creation_date':user.created_at,
#                                         'profile_image':user.profile_image_url_https,
#                                         'profile_banner':user.proprofile_banner_url,
#                                         'liked_at_all':user.favourites_count
                                        }

                for tweet in response.data:
                    # For each tweet, find the author's information
                    author_info = user_dict[tweet.author_id]
                    tweet_dict = {
                                'date': tweet.created_at,
                                'text': tweet.text,
                                'Id': tweet.id,
#                                 'hashtags' : tweet.entities['hashtags'],
#                                 'mentionedUsers': tweet.entities['user_mentions'],
                                "sourceLabel" : "",
                                'sourceUrl' : "",
                                'lang' : tweet.lang,
                                'likeCount': tweet.public_metrics['like_count'],
                                'retweetCount': tweet.public_metrics['retweet_count'],
                                'replyCount': tweet.public_metrics['reply_count'],
                                'Username': author_info['username'],
                                'User_id': tweet.author_id, 
                                'User_description': author_info['description'],
                                'User_created':author_info['creation_date'],
                                'UserfollowersCount': author_info['followers'],
                                'Userlocation': author_info['location'],
#                                 'UserprofileBannerUrl':author_info['profile_banner'],
#                                 'UserprofileImageUrl':author_info['profile_image'],
#                                 "UserLikedAtAll":author_info['liked_at_all'],
#                                 'UserfollowingCount':author_info['following'],
                                'User_tweets': author_info['tweets'],        
                                'USerVerified':author_info['verified'],
                                'quote_count': tweet.public_metrics['quote_count'],
                                }

                    json.dump(tweet_dict, w_obj, default=str)
                    w_obj.write("\n")