export function InputTypeText({ texto }: { texto: string }) {
  return (
    <input
      className="w-[100%] border-solid border-2 rounded-[5px] px-[10px] border-[#D7DADB] overflow-hidden  "
      type="text"
      readOnly
      value={texto}
    />
  );
}
