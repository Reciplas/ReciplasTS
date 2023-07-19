export function LabelObligatorio({ texto }: { texto: string }) {
  return (
    <div className="flex flex-row justify-between   ">
      <label className="font-semibold">{texto}</label>
      <p className="text-[20px]">*</p>
    </div>
  );
}

export function Label({ texto }: { texto: string }) {
  return (
    <label className="font-semibold ">
      <div className=" h-[30px] ">{texto}</div>
    </label>
  );
}
