import { useEffect, useState } from "react";

export function UseFetch(url: string) {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // useEffect(() => {
  //   setLoading(true);
  //   fetch(url)
  //     .then((response) => response.json)
  //     .then((data: any) => {
  //       setData(data);
  //       console.log(datos);
  //     })
  //     .catch((error) => setError(error))
  //     .finally(() => setLoading(false));
  // }, []);

  useEffect(() => {
    fetch(url)
      .then((result) => result.json())
      .then((data) => {
        setData(data);
        console.log(data[2]);
      });
  }, [url]);

  return { data, loading, error };
}
