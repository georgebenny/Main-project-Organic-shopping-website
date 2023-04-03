from flask import Flask, jsonify, request
import cv2
import numpy as np

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def hello_world():
    if request.method == "POST":
        request_data= request.get_json()
        img_path = '../predict_images/'+str(request_data['predict_image'])
        # Load image
        img = cv2.imread(img_path)

        # Convert to grayscale
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Threshold image
        thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]

        # Perform morphological operations to remove noise and fill in gaps
        kernel = np.ones((3, 3), np.uint8)
        opening = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel, iterations=2)

        # Perform distance transform
        dist_transform = cv2.distanceTransform(opening, cv2.DIST_L2, 5)
        dist_transform = cv2.normalize(dist_transform, None, 0, 255, cv2.NORM_MINMAX, cv2.CV_8UC1)

        # Find markers
        markers = cv2.connectedComponents(dist_transform)[1]
        markers = cv2.watershed(img, markers)

        # Find contours
        contours, hierarchy = cv2.findContours(markers.copy(), cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)

        # Calculate defect percentage
        area = np.count_nonzero(markers == -1)
        perimeter = cv2.arcLength(contours[0], True)
        compactness = perimeter ** 2 / area
        defect_percentage = compactness * 100

        # Print result  
        print("Defect percentage: {:.2f}".format(defect_percentage))
        print(type(format(defect_percentage)))
        return jsonify({"predict_res":float(defect_percentage),"predict_status":"Error : Prediction Failed"})
    else:
        return jsonify({"predict_res":-1,"predict_status":"Error : Prediction Failed"})


if __name__ == '__main__':
    app.run()
