import pygame
from pydub import AudioSegment
import io

# Initialize pygame mixer for audio playback
pygame.mixer.init()

# Load MP3 file using pydub
mp3_file = "audio/jenny.mp3"  # Replace with your file path

# Use pydub to read the MP3 file
audio = AudioSegment.from_mp3(mp3_file)

# Export audio to a format pygame can use (WAV in this case)
audio_wav = io.BytesIO()  # Use in-memory file
audio.export(audio_wav, format="wav")
audio_wav.seek(0)  # Rewind to the start of the file

# Load the in-memory WAV data into pygame mixer
pygame.mixer.music.load(audio_wav)

# Play the audio
pygame.mixer.music.play()

# Wait for the audio to finish
while pygame.mixer.music.get_busy():
    pygame.time.Clock().tick(10)

