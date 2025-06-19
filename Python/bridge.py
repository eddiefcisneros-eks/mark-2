from collections import Counter

def usage_count(bridge):
    item_counts = Counter(bridge)
    duplicates = sum(1 for count in item_counts.values() if count > 1)
    return duplicates

bridge = (type[7, 6, 5, 8])
print(usage_count(bridge)) 

#the answer must be 2