import tweepy
import pandas
from collections import Counter
from TwitterSecrets import *

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
auth_api = tweepy.API(auth)

account_list = ["aguialabs", "wehlersdesign", "LeReveduDogon", "SkagerakDanmark","vanwijheverf","BulbUK","GenerationFndt","Danone","NetD_news","HovioneGroup","simplybusiness","EllasKitchenUK","AlfaAccountants","theCOOKkitchen","MacphieUK","Pukkaherbs","Ingeus_uk","ApivitaSA","les2vaches","lilyskitchen","Camif_","BatesWellsTweet","Ecotone_","divinechocolate","pixelis_agency","HerbatintItalia","BigIssue","eqinvestors","ARP_Astrance","Perlagewinery","ruchequiditoui","iglooRegen","nativeadv","ietp_","AgenceSidiese","resourcefutures","Treedom","WHEBsustainable","BridgesFundMgmt","ekodev","CitizenCapital","hcpgroup","microdon_fr","Patte_Blanche","FluidITuk","stonesoupchat","CuentoDeLuz","TrusteesUnltd","MSeedImpact","GreenApesJungle","NuovaVista","clipit_officiel","Investing4Good","Green_Element","wehlersdesign","TribeCapital","LumoFrance","Authenticitys","getyoti","bestreetwize","reviveNV","SkagerakDanmark","vanwijheverf","Fairphone","maseco_pw","PurProjet","BubbleChamber1","squizgourde","Birdeo","FARADGroup","aguialabs","lygofairtrade","actimpact","LeReveduDogon","OnPurposeUK"]
try:
  for target in account_list:
    print("Searching for", target)
    tweets = auth_api.user_timeline(screen_name=target, 
                            count=200,
                            include_rts = True,
                            tweet_mode = 'extended'
                            )
    all_tweets = []
    all_tweets.extend(tweets)
    oldest_id = tweets[-1].id
    while True:
        tweets = auth_api.user_timeline(screen_name=target, 
                              count=200,
                              include_rts = True,
                              max_id = oldest_id - 1,
                              tweet_mode = 'extended'
                              )
        if len(tweets) == 0:
            break
        oldest_id = tweets[-1].id
        all_tweets.extend(tweets)
        print('N of tweets downloaded till now {}'.format(len(all_tweets)))

        outtweets = [[tweet.id_str, 
                      tweet.created_at, 
                      tweet.favorite_count, 
                      tweet.retweet_count, 
                      tweet.full_text.encode("utf-8").decode("utf-8")] 
                    for idx,tweet in enumerate(all_tweets)]
        df = pandas.DataFrame(outtweets,columns=["id","created_at","favorite_count","retweet_count", "text"])
        df.to_csv(r'./csv/%s_tweets.csv' % target,index=False)
        df.head(3)

except BaseException as e:
      print('There seems to be an error: ,',str(e))
