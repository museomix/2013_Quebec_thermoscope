import pygame, os
import RPi.GPIO as GPIO

#GPIO
GPIO.setmode(GPIO.BOARD)
GPIO.setup(12, GPIO.IN)

#IMGS
imgs = os.listdir('img/')
imgs.sort()
nbImgs = len(imgs)
nbImgs = 228 ########################
indImgs = 0

#SDL
pygame.init()
screen = pygame.display.set_mode((720, 480), pygame.RESIZABLE)
surfaces = []
for i in range(nbImgs) :
        surfaces.append(pygame.image.load('img/' + imgs[i]))
rect = surfaces[0].get_rect()

#LOOP
loop = True
while loop :

        #GPIO
        pin = GPIO.input(12)
        indImgs += indImgs < nbImgs - 1 if pin else (indImgs > 0) * -1
        #EVENTS
        for e in pygame.event.get() :
                if e.type == pygame.QUIT :
                        loop = False
                elif e.type == pygame.KEYDOWN :
                        if e.key == pygame.K_ESCAPE :
                               loop = False

        #BLIT
        screen.blit(surfaces[indImgs], rect)
        pygame.display.flip()

#QUIT
pygame.quit()

