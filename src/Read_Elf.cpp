#include"Read_Elf.h"

FILE *elf=NULL;
Elf64_Ehdr elf64_hdr;

//Program headers
unsigned int padr=0;
unsigned int psize=0;
unsigned int pnum=0;

//Section Headers
unsigned int sadr=0;
unsigned int ssize=0;
unsigned int snum=0;

//Symbol table
unsigned int symnum=0;
unsigned int symadr=0;
unsigned int symsize=0;

unsigned int Index=0;

unsigned int stradr=0;
unsigned int strsize=0;


bool open_file(const char* filename)
{
	file = fopen(filename, "rb");
	if(!file)
	{
		printf("open file %s failed\n", filename);
		exit(0);
	}
	elf = fopen("./elf_info.txt", "wb");
	if(!elf)
	{
		printf("open file elf_info.txt failed\n");
		exit(0);
	}
	return true;
}

void read_elf(const char* filename)
{
	open_file(filename);

	fprintf(elf,"ELF Header:\n");
	read_Elf_header();

	fprintf(elf,"\n\nSection Headers:\n");
	read_elf_sections();

	fprintf(elf,"\n\nProgram Headers:\n");
	read_Phdr();

	fprintf(elf, "\n\nSymbol table:\n");
	read_symtable();

	fclose(elf);
}

void read_Elf_header()
{
	//file should be relocated
	fread(&elf64_hdr,1,sizeof(elf64_hdr),file);
	
	if(elf64_hdr.e_ident[0] != 0x7f || elf64_hdr.e_ident[1] != 0x45 ||
			elf64_hdr.e_ident[2] != 0x4c || elf64_hdr.e_ident[3] != 0x46)
	{
		printf("this file is not an elf file\n");
		exit(0);
	}

	fprintf(elf," magic number:  ");
	for(int i = 0; i < 16; ++i)
		fprintf(elf, "%02x ", elf64_hdr.e_ident[i]);
	fprintf(elf, "\n");

	if(elf64_hdr.e_ident[EI_CLASS] == 0x01)
		fprintf(elf," Class:  ELFCLASS32\n");
	else // 0x02
		fprintf(elf, " Class:  ELFCLASS64\n");
	
	if(elf64_hdr.e_ident[EI_DATA] == 0x01)
		fprintf(elf," Data:  little-endian\n");
	else // 0x02
		fprintf(elf, " Data:  big-endian\n");
		
	fprintf(elf," Version:  %02x \n", elf64_hdr.e_ident[EI_VERSION]);

	fprintf(elf," OS/ABI:	 System V ABI\n");
	
	fprintf(elf," ABI Version:  %02x \n", elf64_hdr.e_ident[EI_ABIVERSION]);
	
	fprintf(elf," Type:  ");
	switch(elf64_hdr.e_type)
	{
	case 1: fprintf(elf, "REL \n"); break;
	case 2: fprintf(elf, "EXEC \n"); break;
	case 3: fprintf(elf, "DYN \n"); break;
	}
	
	fprintf(elf," Machine:  %hx \n", elf64_hdr.e_machine);

	fprintf(elf," Version:  0x%x\n", elf64_hdr.e_version);

	entry = elf64_hdr.e_entry;
	fprintf(elf," Entry point address:  0x%lx\n", entry);

	padr = elf64_hdr.e_phoff;
	fprintf(elf," Start of program headers:    %d bytes into  file\n", padr);

	sadr = elf64_hdr.e_shoff;
	fprintf(elf," Start of section headers:    %d bytes into  file\n", sadr);

	fprintf(elf," Flags:  0x%x\n", elf64_hdr.e_flags);

	fprintf(elf," Size of this header:  %hd Bytes\n", elf64_hdr.e_ehsize);

	psize = elf64_hdr.e_phentsize;
	fprintf(elf," Size of program headers:  %hd Bytes\n", psize);

	pnum = elf64_hdr.e_phnum;
	fprintf(elf," Number of program headers:  %hd \n", pnum);

	ssize = elf64_hdr.e_shentsize;
	fprintf(elf," Size of section headers:   %hd Bytes\n", ssize);

	snum = elf64_hdr.e_shnum;
	fprintf(elf," Number of section headers: %hd \n", snum);

	Index = elf64_hdr.e_shstrndx;
	fprintf(elf," Section header string table index:  %hd \n", Index);
}

void read_elf_sections()
{
	Elf64_Shdr tmp_shdr;

	fseek(file, sadr + Index * sizeof(Elf64_Shdr), SEEK_SET);
	fread(&tmp_shdr, 1, sizeof(tmp_shdr), file);

	fseek(file, tmp_shdr.sh_offset, SEEK_SET);
	char section_name[10000];
	fread(section_name, 1, tmp_shdr.sh_size, file);


	fseek(file, sadr, SEEK_SET);

	for(int c=0;c<snum;c++)
	{
		fprintf(elf," [%3d]\n",c);
		
		//file should be relocated
		fread(&tmp_shdr,1,sizeof(tmp_shdr),file);

		char *name = section_name + tmp_shdr.sh_name;
		fprintf(elf," Name: %s", name);

		fprintf(elf," Type: %d ", tmp_shdr.sh_type);

		fprintf(elf," Address:  0x%lx ", tmp_shdr.sh_addr);

		fprintf(elf," Offest:  0x%lx\n", tmp_shdr.sh_offset);

		fprintf(elf," Size:  %ld", tmp_shdr.sh_size);

		fprintf(elf," Entsize:  %ld", tmp_shdr.sh_entsize);

		fprintf(elf," Flags:   0x%lx", tmp_shdr.sh_flags);
		
		fprintf(elf," Link:  %d", tmp_shdr.sh_link);

		fprintf(elf," Info:  %d", tmp_shdr.sh_info);

		fprintf(elf," Align: 0x%lx\n", tmp_shdr.sh_addralign);

		if(!strcmp(name, ".text"))
		{
			coff = tmp_shdr.sh_offset;
			csize = tmp_shdr.sh_size;
			cadr = tmp_shdr.sh_addr;
		}
		else if(!strcmp(name, ".data"))
		{
			doff = tmp_shdr.sh_offset;
			dsize = tmp_shdr.sh_size;
			dadr = tmp_shdr.sh_addr;
		}
		else if(!strcmp(name, ".strtab"))
		{
			stradr = tmp_shdr.sh_offset;
			strsize = tmp_shdr.sh_size;
		}
		else if(!strcmp(name, ".symtab"))
		{
			symadr = tmp_shdr.sh_offset;
			symsize = tmp_shdr.sh_size;
		}
	}
}

void read_Phdr()
{
	Elf64_Phdr tmp_phdr;

	fseek(file, padr, SEEK_SET);

	for(int c=0;c<pnum;c++)
	{
		fprintf(elf," [%3d]\n",c);
			
		//file should be relocated
		fread(&tmp_phdr,1,sizeof(tmp_phdr),file);

		fprintf(elf," Type:   %d", tmp_phdr.p_type);
		
		fprintf(elf," Flags:   %d", tmp_phdr.p_flags);
		
		fprintf(elf," Offset:  0x%lx", tmp_phdr.p_offset);
		
		fprintf(elf," VirtAddr:  0x%lx", tmp_phdr.p_vaddr);
		
		fprintf(elf," PhysAddr:   0x%lx", tmp_phdr.p_paddr);

		fprintf(elf," FileSiz:   %ld", tmp_phdr.p_filesz);

		fprintf(elf," MemSiz:   %ld", tmp_phdr.p_memsz);
		
		fprintf(elf," Align:   %ld\n", tmp_phdr.p_align);
	}
}

void read_symtable()
{
	Elf64_Sym elf64_sym;

	fseek(file, stradr, SEEK_SET);
	char symname[10000];
	fread(symname, 1, strsize, file);

	fseek(file, symadr, SEEK_SET);
	symnum = symsize / sizeof(elf64_sym);

	for(int c = 0; c < symnum; c++)
	{
		fprintf(elf, " [%3d]  ", c);

		//file should be relocated
		fread(&elf64_sym, 1, sizeof(elf64_sym), file);

		char *name = symname + elf64_sym.st_name;
		fprintf(elf, " Name:  %40s  ", name);

		fprintf(elf, " Bind:  ");

		fprintf(elf, " Type:  ");

		fprintf(elf, " NDX:  %hd", elf64_sym.st_shndx);

		fprintf(elf, " Size:  %ld", elf64_sym.st_size);

		fprintf(elf, " Value:  %lx\n", elf64_sym.st_value);
	
		if(!strcmp(name, "main"))
		{
			madr = elf64_sym.st_value;
			endPC = madr + elf64_sym.st_size;	
		}
		else if(!strcmp(name, "__global_pointer$"))
		{
			gp = elf64_sym.st_value;
		}
	}
}
