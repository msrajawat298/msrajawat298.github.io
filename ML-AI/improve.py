import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from nltk.stem import WordNetLemmatizer
import string

nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

def preprocess_text(text):
    # Tokenize the text
    tokens = word_tokenize(text)
    
    # Remove punctuation
    tokens = [word for word in tokens if word not in string.punctuation]
    
    # Remove stop words
    stop_words = set(stopwords.words('english'))
    tokens = [word for word in tokens if word.lower() not in stop_words]
    
    # Perform stemming
    stemmer = PorterStemmer()
    tokens = [stemmer.stem(word) for word in tokens]
    
    # Perform lemmatization
    lemmatizer = WordNetLemmatizer()
    tokens = [lemmatizer.lemmatize(word) for word in tokens]
    
    # Join the tokens back into a single string
    preprocessed_text = ' '.join(tokens)
    
    return preprocessed_text

def create_vector_db():
    # Specify the encoding as 'latin-1'
    file_encoding = 'latin-1'
    loader = CSVLoader(file_path=os.environ["TRAIN_DATA_FILE_PATH"], source_column="prompt", encoding=file_encoding)
    # Load data from FAQ sheet
    data = loader.load()
    
    # Preprocess the text data
    preprocessed_data = [(preprocess_text(entry['prompt']), entry['response']) for entry in data]
    
    # Create a FAISS instance for vector database from preprocessed data
    vectordb = FAISS.from_documents(documents=preprocessed_data, embedding=instructor_embeddings)

    # Save vector database locally
    vectordb.save_local(vectordb_file_path)
