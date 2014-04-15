# input: PIL Image object img, dimensions 210x160
# output: PIL image object, dimensions 110x84
def preprocessImage(img):

    # crop to 160x160
    roi = (0, 33, 160, 193) # region of interest (roi) is lines 33 to 193
    img = img.crop(roi)

    # downscale to 84x84
    newSize = 84, 84
    img.thumbnail(newSize) # resizing step
    img.show()

    return img


# input: list in the form [img1, a1, img2, a2, ...] where img's are PIL Image objects (210x160) and a's are actions (doesn't really matter what kind of objects
# output: the same list with all the image objects preprocessed
def preprocessSequence(sequence):
    from PIL import Image
    for i in xrange(0,len(sequence),2):             # look at 0-th, 2nd, 4th etc element of the list
        ob = sequence[i]
        #assert isinstance(ob, Image)                # make sure Python knows what type of object it has
        sequence[i] = preprocessImage(ob)           # preprocess and reassign
    return