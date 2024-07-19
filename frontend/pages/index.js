import Head from 'next/head'
import Image from 'next/image'
import axios from 'axios';

const Index = ({ message }) => {
  return (
    <>
      <Head>
        <title>Simple Hello world frontend</title>
        <meta name="description" content="Simple hello world frontend" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.png" />
      </Head>
      <main>
        <div style={{ marginTop: '100px' }}>
          <Image 
            src="/logo.svg" 
            width={200} 
            height={200}
          />
        </div>
        <h4>Response from backend:</h4>
        <h2>{ message }</h2>
      </main>
    </>
  )
}

export async function getServerSideProps() {
  try {
    const res = await axios.get(`${process.env.BACKEND_API_URL}/api/v1/hello_world/`, { headers: { 'Authorization': `ZeroOneGroup ${process.env.BACKEND_AUTH_TOKEN }` }});
    const data = res.data;

    return {
      props: {
        message: data.message,
      },
    };

  } catch (error) {
    return {
      props: {
        message: 'Backend connection failed',
      },
    };
  }
}

export default Index;