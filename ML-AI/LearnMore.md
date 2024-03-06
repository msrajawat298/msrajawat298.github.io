## What is GPT?
Ans. GPT (Generative Pre-trained Transformer) is a family of (LLM) large language models developed by OpenAI.

## What is LLM?
Ans. Large language model (LLM) is a general term for a type of artificial intelligence (AI) model that is trained on massive amounts of text data to communicate and generate human-like text in response to a wide range of prompts and questions.

## What is Embeddings ?
Ans. Embedding is data, such as words, that has been converted into an array of numbers known as a vector. 
- This vector contains patterns of relationships, and the combination of these numbers forms a multi-dimensional map used to measure similarity. 
- For a simple example, consider a 2D graph: the words "dog" and "puppy" are often used in similar situations, so in a word embedding, they would be represented by vectors that are close together.
- However, in reality, the vector has hundreds of dimensions that cover the rich, multi-dimensional complex relationships between words. Images can also be turned into vectors, as demonstrated by Google's similar image searches. 
- Embeddings are dense vector representations of words or phrases in a continuous vector space. 
- These representations capture semantic relationships between words and are commonly used in natural language processing tasks like language translation, sentiment analysis, and document classification.

## What is Vector Databases ?
Ans. Vector databases are databases optimized for storing and querying vector data efficiently. They are commonly used in applications where similarity search or nearest neighbor search is important, such as recommendation systems or information retrieval.

## What is prompts?
Ans. Prompts are input phrases or sentences given to a language model like GPT to generate text. They provide context and guidance to the model on what kind of response is expected.

## What is Score Threshold?
Ans. Score Threshold is a parameter used to filter out responses from a language model based on their confidence score. Responses with a score below the threshold are discarded.

## What is temperature in the context of ai model?
Ans. In the context of AI models, temperature is a parameter used during text generation to control the randomness of the generated output. A higher temperature leads to more randomness and diversity in the generated text, while a lower temperature produces more conservative and predictable output.


## What is Prompt template?
Ans. A prompt template is a predefined structure or format for prompts used to interact with a language model. It helps guide users in providing input to the model and can improve the quality of generated responses.

## What is FAISS?
Ans. FAISS (Facebook AI Similarity Search) is an open-source library for efficient similarity search and clustering of dense vectors. It's commonly used in machine learning applications for tasks like recommendation systems and image retrieval.

## What is fine-tuned?
Ans. Fine-tuning refers to the process of taking a pre-trained language model like GPT and further training it on a specific dataset or task to adapt it to that particular domain or improve its performance on that task. Fine-tuning allows for more targeted and specialized use of the model.

## What is LangChain?
Ans. LangChain is an open-source framework designed to simplify the creation of applications powered by large language models (LLMs). It essentially acts as a set of tools and building blocks that developers can use to build various LLM-driven applications.
[js](https://js.langchain.com/docs/get_started/introduction)
[python](https://python.langchain.com/docs/get_started/introduction)

## What is NLP?
NLP, or Natural Language Processing, is a field of artificial intelligence that focuses on the interaction between computers and humans through natural language. The ultimate objective of NLP is to read, decipher, understand, and make sense of the human language in a valuable way.

- NLP involves several tasks and techniques, including but not limited to:

    - **Tokenization:** Breaking down text into words, phrases, symbols, or other meaningful elements (tokens).
    - **Part-of-Speech (POS) Tagging:** Identifying the grammatical parts of speech (nouns, verbs, adjectives, etc.) in a sentence.
    - **Named Entity Recognition (NER):** Identifying and categorizing named entities in text (like names of people, organizations, locations, expressions of times, quantities, etc.).
    - **Sentiment Analysis:** Determining the emotional tone behind words to gain an understanding of the attitudes, opinions, and emotions expressed within a text.
    - **Machine Translation:** Automatically translating text from one language to another.
    - **Speech Recognition and Generation:** Converting spoken language into written form and vice versa.

NLP is used in a variety of applications, including search engines, voice assistants, sentiment analysis, machine translation, and text summarization.

## What Pre-trained pipeline?
- A pre-trained pipeline refers to a pre-built and pre-trained model that combines multiple natural language processing (NLP) tasks into a single pipeline. 
- These tasks can include tokenization, part-of-speech tagging, named entity recognition, sentiment analysis, and more. 
- By using a pre-trained pipeline, developers can quickly and easily perform various NLP tasks without having to build and train individual models for each task.

## What are some popular libraries or frameworks used for NLP tasks in Python?
There are several popular libraries and frameworks used for Natural Language Processing (NLP) tasks in Python. Here are a few:

- **NLTK (Natural Language Toolkit):** NLTK is a leading platform for building Python programs to work with human language data. It provides easy-to-use interfaces to over 50 corpora and lexical resources.

- **spaCy:** spaCy is a free, open-source library for advanced NLP in Python. It's designed specifically for production use and helps you build applications that process and understand large volumes of text.

- **Gensim:** Gensim is a Python library for topic modelling, document indexing and similarity retrieval with large corpora. It's designed to handle large text collections using data streaming and incremental algorithms.

- **StanfordNLP:** StanfordNLP is a Python natural language analysis package. It contains tools, which can provide robust, efficient linguistic analysis of your text data.

- **Transformers (by Hugging Face):** Transformers provides state-of-the-art general-purpose architectures (BERT, GPT-2, RoBERTa, XLM, DistilBert, etc.) for Natural Language Understanding (NLU) and Natural Language Generation (NLG).

- **TextBlob:** TextBlob is a Python library for processing textual data. It provides a simple API for diving into common natural language processing (NLP) tasks such as part-of-speech tagging, noun phrase extraction, sentiment analysis, and more.

## How to Optimize your modal?
- Preprocessing data before creating a vector database involves several steps to clean and standardize the text data. Here's a breakdown of some common preprocessing techniques:

1. **Removing stop words:** Stop words are common words like "the", "is", "and", etc., which occur frequently in a language but often do not carry significant meaning. Removing these words can help reduce noise in the data and improve the efficiency of vectorization.

2. **Stemming or lemmatization:** Both stemming and lemmatization are techniques used to reduce words to their base or root forms. Stemming involves chopping off prefixes or suffixes to achieve this, while lemmatization involves mapping words to their dictionary form (lemma). This helps in reducing the dimensionality of the data and consolidating similar words. [Stemming and Lemmatization](https://youtu.be/HHAilAC3cXw?si=WUaLXMN4FU-uHXeo)

3. **Text normalization:** This encompasses various techniques to standardize text, such as converting all letters to lowercase, removing punctuation marks, and handling special characters or numbers in a consistent manner. Normalization ensures that variations in text representation are minimized, leading to more effective vectorization.

## [Hugging Face ](https://huggingface.co/docs/hub/index)
- Hugging Face is a company and a popular platform in the field of natural language processing (NLP). - They are known for their open-source libraries and pre-trained models that facilitate various NLP tasks, such as text classification, language translation, and text generation. 
- One of their most famous contributions is the Transformers library, which provides a collection of state-of-the-art pre-trained models and tools for building, training, and deploying NLP models. 
- Hugging Face also offers an online platform where users can access these models, collaborate on projects, and deploy models into production environments. 
- Overall, Hugging Face has played a significant role in advancing the accessibility and usability of NLP technology.
- https://youtu.be/_j7JEDWuqLE?si=9ByQge6J8UpkSCbT

## Transformer in NLP
- Transformers have revolutionized NLP by achieving state-of-the-art results in various tasks, such as language translation, text generation, and sentiment analysis.
- The key innovation of transformers lies in their attention mechanism, which allows the model to focus on different parts of the input sequence when processing it. 
- This attention mechanism enables transformers to capture long-range dependencies in text data more effectively compared to traditional recurrent neural networks (RNNs) or convolutional neural networks (CNNs).
- The transformer architecture consists of multiple layers of self-attention mechanisms and feedforward neural networks. 
- Each layer processes the input sequence independently and passes its output to the next layer. 
- Through this hierarchical processing, transformers can learn complex patterns and relationships within the input data.