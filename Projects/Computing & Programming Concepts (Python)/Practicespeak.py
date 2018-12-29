class Dog():
    def __init__(self,speak,talk):
        self.speak=speak
        self.talk=talk
    def __repr__(self):
        return(self.speak,self.talk)
    def __str__(self):
        return(self.speak,self.talk)
        
