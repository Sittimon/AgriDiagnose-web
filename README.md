# AgriDiagnose-web 🌽

ระบบวิเคราะห์และวินิจฉัยโรคข้าวโพดด้วย AI แบบเรียลไทม์ ที่รองรับหลายภาษา พร้อมคำแนะนำจากผู้เชี่ยวชาญ

## ✨ คุณสมบัติหลัก

- 🔍 **ตรวจจับโรคอัตโนมัติ**: ใช้ Azure Custom Vision API ตรวจหาตำแหน่งใบข้าวโพดอัตโนมัติ
- 🎯 **วิเคราะห์โรคด้วย AI**: ใช้ Deep Learning (ResNet18) วิเคราะห์โรคด้วยความแม่นยำสูง
- 🌡️ **Grad-CAM Visualization**: แสดงภาพความร้อนเพื่อระบุบริเวณที่ AI ให้ความสนใจ
- ✂️ **เลือกพื้นที่ด้วยตนเอง**: รองรับการครอปภาพด้วยตนเองเพื่อความแม่นยำ
- 🤖 **คำแนะนำจาก AI Expert**: ใช้ GPT-4 ให้คำแนะนำการดูแลรักษาตามโรคที่พบ
- 🌐 **รองรับหลายภาษา**: ไทย, English, Tiếng Việt, Bahasa Indonesia, Filipino, Bahasa Melayu, 中文, မြန်မာ, ភាសាខ្មែរ, ລາວ

## 🦠 โรคที่สามารถตรวจจับได้

1. **Herbicide Injury** - ความผิดปกติจากสารกำจัดวัชพืช
2. **Northern Corn Leaf Blight** - โรคใบไหม้แผลใหญ่
3. **Brown Spot** - โรคใบจุดสีน้ำตาล
4. **Twisted Whorl** - ยอดอ่อนบิดเป็นปม
5. **Healthy** - ปกติ/สุขภาพดี
6. **Downy Mildew** - โรคราน้ำค้าง
7. **Rust** - โรคราสนิม
8. **Smut** - ราเขม่าดำ
9. **Leaf Sheath and Leaf Spot** - โรคกาบและใบจุด
10. **Virus** - โรคใบด่างจากไวรัส

## 🛠️ เทคโนโลยีที่ใช้

- **Frontend**: Streamlit
- **Deep Learning**: PyTorch + TorchVision (ResNet18)
- **Computer Vision**: OpenCV, PIL
- **Detection API**: Azure Custom Vision API
- **AI Assistant**: OpenAI GPT-4
- **Visualization**: Grad-CAM

## 📋 ความต้องการของระบบ

- Python 3.8+
- CUDA (ถ้าต้องการใช้ GPU)
- Azure Custom Vision API key
- OpenAI API key

## ⚙️ การติดตั้ง

### 1. Clone Repository

```bash
git clone https://github.com/Sittimon/AgriDiagnose-web.git
cd AgriDiagnose-web
```

### 2. สร้าง Virtual Environment (แนะนำ)

```bash
python -m venv venv
source venv/bin/activate  # สำหรับ Linux/Mac
# หรือ
.\venv\Scripts\activate  # สำหรับ Windows
```

### 3. ติดตั้ง Dependencies

```bash
pip install -r requirements.txt
```

### 4. ตั้งค่า Environment Variables

สร้างไฟล์ `.env` ในโฟลเดอร์หลัก:

```env
CUSTOM_VISION_PREDICTION_KEY=your_azure_custom_vision_key
chat-gpt-api-key=your_openai_api_key
```

### 5. ตรวจสอบไฟล์ Model

ตรวจสอบว่ามีไฟล์ `best_jitter.pth` (โมเดล ResNet18) อยู่ในโฟลเดอร์หลัก
สามารถ download ได้ที่ https://disk.yandex.com/d/BYixpO12d4KH0w

## 🚀 การใช้งาน

### รันแอปพลิเคชัน

```bash
streamlit run web_asean.py
```

แอปจะเปิดที่ `http://localhost:8501`

### วิธีใช้งาน

1. **เลือกภาษา**: เลือกภาษาที่ต้องการใช้จากเมนูมุมบนขวา
2. **อัปโหลดภาพ**: อัปโหลดภาพใบข้าวโพด หรือใส่ URL ของภาพ
3. **ปรับค่า Confidence Threshold**:
   - **Leaf Confidence**: ความมั่นใจในการตรวจจับใบ (50-99%)
   - **Disease Confidence**: ความมั่นใจในการวินิจฉัยโรค (0-99%)
4. **เลือกโหมดการวิเคราะห์**:
   - **Auto Crop**: ตรวจจับและวิเคราะห์อัตโนมัติ
   - **Manual Crop**: เลือกพื้นที่ด้วยตนเอง
5. **ดูผลลัพธ์**: ระบบจะแสดงโรคที่พบและคำแนะนำ
6. **เปิด Grad-CAM**: (ตัวเลือก) ดูภาพความร้อนที่แสดงบริเวณที่ AI วิเคราะห์
7. **ขอคำแนะนำ**: กดปุ่ม "Expert Advice" เพื่อรับคำแนะนำจาก AI

## 📱 รองรับ Mobile

แอปพลิเคชันออกแบบให้ responsive รองรับการใช้งานบนมือถือและแท็บเล็ต

## 🐳 Docker Support

### Build Docker Image

```bash
docker build -t agridiagnose-web .
```

### Run Container

```bash
docker run -p 8501:8501 --env-file .env agridiagnose-web
```

## 📁 โครงสร้างโปรเจค

```
AgriDiagnose-web/
├── web_asean.py           # Main application file
├── gpt_prompt.py          # GPT prompts for all languages
├── languages.py           # UI translations
├── best_jitter.pth        # Trained ResNet18 model
├── requirements.txt       # Python dependencies
├── Dockerfile            # Docker configuration
├── .env                  # Environment variables (create this)
└── README.md            # This file
```

## 🔑 API Keys

### Azure Custom Vision
1. สมัครใช้งาน [Azure Portal](https://portal.azure.com)
2. สร้าง Custom Vision resource
3. คัดลอก Prediction Key และ Endpoint

### OpenAI API
1. สมัครที่ [OpenAI Platform](https://platform.openai.com)
2. สร้าง API Key
3. ใส่ใน environment variables

## 📊 Model Information

- **Architecture**: ResNet18
- **Input Size**: 448x448
- **Classes**: 10 โรค
- **Training**: Transfer Learning with data augmentation (jitter)

## 🤝 การมีส่วนร่วม

ยินดีรับ Pull Requests และ Issues!

## 📄 License

โปรเจคนี้เป็นโอเพนซอร์ส สามารถใช้งานได้อย่างอิสระ

## 👨‍💻 ผู้พัฒนา

**Sittimon**

- GitHub: [@Sittimon](https://github.com/Sittimon)

## 🙏 Acknowledgments

- Azure Custom Vision API
- OpenAI GPT-4
- PyTorch Team
- Streamlit Community

## 📞 ติดต่อ

หากมีข้อสงสัยหรือต้องการความช่วยเหลือ กรุณาเปิด Issue ใน GitHub Repository

---

Made with ❤️ for Agriculture
